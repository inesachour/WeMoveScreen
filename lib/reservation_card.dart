import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/constants/reservations.dart';
import 'package:wemove_test/widgets/card_widgets.dart';

class ReservationCard extends StatefulWidget {

  ReservationCard({required this.reservation , required this.deleting});

  Reservation reservation;
  var deleting;

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {

  bool onDeleteClicked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: thirdBackgroundColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Jeu 10", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                          Text("Fév", style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      )
                  ),
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
              Text(
                "ok",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 10,),
              Text("Lyon Sport", style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 7,),
              Text("de 1h à 7h", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700)),
              SizedBox(height: 7,),
              Text("Places réservés", style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("10.00", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                  Row(
                    children: [
                      incdecButton(color: secondaryBackgroundColor, text: "-", onPressed: (){
                        setState(() {
                          if(widget.reservation.reservedPlaces>0){
                            widget.reservation.reservedPlaces--;
                          }
                        });
                      }),
                      SizedBox(
                        width: 40,
                          child: Text( widget.reservation.reservedPlaces.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,
                          )
                      ),
                      incdecButton(color: thirdBackgroundColor, text: "+",onPressed:  (){
                        setState(() {
                          widget.reservation.reservedPlaces++;
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



