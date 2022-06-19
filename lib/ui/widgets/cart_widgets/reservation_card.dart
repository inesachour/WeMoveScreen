import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/core/models/partner.dart';
import 'package:wemove_test/core/models/reservation.dart';
import 'package:wemove_test/core/services/dates_service.dart';
import 'package:wemove_test/core/services/partners_service.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';
import 'package:wemove_test/ui/widgets/common/display_widgets.dart';
import 'package:wemove_test/ui/widgets/cart_widgets/cart_widgets.dart';

class ReservationCard extends StatefulWidget {

  ReservationCard({required this.reservation,});

  Reservation reservation;


  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {

  bool onDeleteClicked = false;
  Partner? partner;

  @override
  Widget build(BuildContext context) {

    List<String> date = DatesService.getShortDate(widget.reservation.course.courseInfos[0].date);
    Future<Partner?> futurePartner = PartnersService.getPartnerById(widget.reservation.course.partnerId);

    getPartner() async{
      futurePartner.then((value) {
        if(mounted && partner == null){
          setState(() {
            partner = value;
          });
        }
      });
    }

    getPartner();


    List<String> duration = DatesService.getTime(widget.reservation.course.courseInfos[0].date, widget.reservation.course.duration);

    return partner != null
        ? Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/images/${widget.reservation.course.activity.image1}"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.srcOver
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //Displaying Date
                  Container(
                      height: 62,
                      width: 80,
                      decoration: BoxDecoration(
                          color: thirdBackgroundColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(date[0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                          Text(date[1], style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      )
                  ),


                  //Delete Button
                  Row(
                    children: [
                      InkWell(
                          child: Icon(Icons.delete, color: onDeleteClicked ? Colors.red :Colors.white,size: 30,),
                          onTap: (){
                            setState(() {
                              onDeleteClicked = !onDeleteClicked;
                            });
                          }
                      ),

                      onDeleteClicked ? InkWell(
                          child: Text("Supprimer", style: TextStyle(color: Colors.red, fontSize: 16),),
                          onTap: (){
                            Provider.of<CartView>(context,listen: false).deleteReservation(reservation: widget.reservation);
                          },

                      ): SizedBox(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),


              //Displaying Title
              Text(
                widget.reservation.course.courseInfos[0].title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 10,),


              //Displaying place
              Text(partner != null ?partner!.name: "", style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 7,),


              //Displaying duration if exists
              DurationWidget(start: duration[0], end: duration[1]),
              SizedBox(height: 7,),


              //Displaying reserved Places
              Text("Places réservés: "+widget.reservation.reservedPlaces.toString(), style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //Displating price
                  PriceWidget(
                      text: widget.reservation.course.daypassOnly != 1
                          ? widget.reservation.course.courseInfos[0].nomadPrice!.toStringAsFixed(2)
                          : partner!.passPrice.toStringAsFixed(2),
                      fontWeight: FontWeight.w800,
                      fontSizeMainText: 22,
                      fontSizeCurrency: 13
                  ),


                  //Displaying, increasing and decreasing reserved places
                  Row(
                    children: [

                      //Decrement Button
                      incdecButton(color: secondaryBackgroundColor, text: "-", onPressed: (){
                        if(widget.reservation.reservedPlaces>0){
                          Provider.of<CartView>(context, listen: false).decrementReservationsPlaces(reservation: widget.reservation);
                        }
                        if(widget.reservation.reservedPlaces==0){
                          Provider.of<CartView>(context, listen: false).deleteReservation(reservation: widget.reservation);
                        }
                      }),

                      //Number of reserved places
                      SizedBox(
                        width: 40,
                          child: Consumer<CartView>(
                            builder: (context,cart,child){
                              return Text( cart.reservations.where((element) => element.course.id == widget.reservation.course.id).first.reservedPlaces.toString(),
                                style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,
                              );
                            },
                          )
                      ),

                      //Increment Button
                      incdecButton(color: thirdBackgroundColor, text: "+",onPressed:  (){
                          Provider.of<CartView>(context,listen: false).incrementReservationsPlaces(reservation: widget.reservation);
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
        : SizedBox();
  }
}



