import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/data/reservations.dart';
import 'package:wemove_test/widgets/displaying_widgets.dart';

class ReservationCard extends StatefulWidget {

  ReservationCard({required this.reservation , required this.deleting, required this.updatingTotal});

  Reservation reservation;
  var deleting;
  var updatingTotal;


  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {

  bool onDeleteClicked = false;
  String? duree = null;


  @override
  Widget build(BuildContext context) {

    if(widget.reservation.heureDebut != null && widget.reservation.heureFin != null){
      duree = "De "+ widget.reservation.heureDebut! + " à "+ widget.reservation.heureFin!;
    }

    //Duration Time formatting to french
    initializeDateFormatting('fr');
    var date = widget.reservation.date;
    var jour = capitalize(DateFormat('EEE dd',"FR-fr").format(date).replaceAll('.', ''));
    var mois = capitalize(DateFormat('MMM',"fr").format(date).replaceAll('.', ''));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.reservation.image),
            fit: BoxFit.cover,
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
                      height: 60,
                      width: 75,
                      decoration: BoxDecoration(
                          color: thirdBackgroundColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(jour, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                          Text(mois, style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      )
                  ),


                  //Delete Button
                  Row(
                    children: [
                      InkWell(
                          child: Icon(Icons.delete, color: onDeleteClicked ? Colors.red :Colors.white,),
                          onTap: (){
                            setState(() {
                              onDeleteClicked = !onDeleteClicked;
                            });
                          }
                      ),

                      onDeleteClicked ? InkWell(
                          child: Text("Supprimer", style: TextStyle(color: Colors.red, fontSize: 16),),
                          onTap: widget.deleting,

                      ): SizedBox(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),


              //Displaying Title
              Text(
                widget.reservation.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 10,),


              //Displaying place
              Text(widget.reservation.place, style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 7,),


              //Displaying duration if exists
              duree != null ? DurationWidget(duree: duree!): SizedBox(),
              SizedBox(height: 7,),


              //Displaying reserved Places
              Text("Places réservés: "+widget.reservation.reservedPlaces.toString(), style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //Displating price
                  DisplayPrice(
                      text: widget.reservation.price.toStringAsFixed(2),
                      fontWeight: FontWeight.w800,
                      fontSizeMainText: 22,
                      fontSizeCurrency: 13
                  ),


                  //Displaying, increasing and decreasing reserved places
                  Row(
                    children: [

                      //Decrement Button
                      incdecButton(color: secondaryBackgroundColor, text: "-", onPressed: (){
                        setState(() {
                          if(widget.reservation.reservedPlaces>0){
                            widget.reservation.reservedPlaces--;
                            widget.updatingTotal();
                          }
                        });
                      }),

                      //Number of reserved places
                      SizedBox(
                        width: 40,
                          child: Text( widget.reservation.reservedPlaces.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,
                          )
                      ),

                      //Increment Button
                      incdecButton(color: thirdBackgroundColor, text: "+",onPressed:  (){
                        setState(() {
                          widget.reservation.reservedPlaces++;
                          widget.updatingTotal();
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);



