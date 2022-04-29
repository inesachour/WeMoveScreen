import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/data/reservations.dart';
import 'package:wemove_test/reservation_card.dart';
import 'package:wemove_test/widgets/panier_widgets.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key}) : super(key: key);

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var total = calculateTotal(reservations);


    return Scaffold(

      //APPBAR
      appBar: AppBar(
        title: Text("Mon panier", style: TextStyle(fontWeight: FontWeight.w700),),
        leading: Container(
          margin: EdgeInsets.all(5),
          child: Icon(Icons.arrow_back),
          decoration: BoxDecoration(
            color: secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        backgroundColor: primaryBackgroundColor,
        elevation: 0,
      ),



      body: Stack(
        children: [

          //Text and Reservations Scroll
          Container(
            color: primaryBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Column(
                        children: [
                          SizedBox(height: 8,),
                          SizedBox(
                              width: width,
                              child: Text(
                                "Cette réservation n'est pas pour toi? Après avoir finalisé l'achat, tu pourras modifier le bénéficiaire de chaque accès en indiquant son nom.",
                                textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 14),)
                          ),
                          SizedBox(height: 8,),
                          SizedBox(
                              width: width,
                              child: InkWell(
                                child: Text(
                                    "Vider le panier",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.white, fontSize: 16,decoration: TextDecoration.underline)
                                ),
                                onTap: (){
                                    setState(() {
                                      reservations.clear();
                                    });
                                },
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Reservations List
                  Expanded(
                    flex: 7,
                    child: reservations.length > 0 ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: reservations.length,
                        itemBuilder: (context, index){
                          return Dismissible(
                            key: Key(reservations[index].id.toString()),
                            child: ReservationCard(
                              reservation: reservations[index],
                              deleting: (){setState(() {reservations.removeAt(index);});},
                              updatingTotal: (){setState(() { total = calculateTotal(reservations); });},
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                reservations.removeAt(index);
                              });
                            },
                          );
                        }
                    ) : SizedBox.expand(
                        child: Center(
                            child: Text("Pas encore d'endorphines par ici",
                              style: TextStyle(color: Colors.white, fontSize: 18),)
                        )
                    ),
                  ),
                  SizedBox(height: height*0.11,),
                ],
              ),
            ),
          ),



          //Bottom Navigation Bar
          Positioned(
              bottom: 0,
              child: Container(
                height: height*0.11,
                width: width,
                decoration: BoxDecoration(
                    color: secondaryBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: BottomNavBar(height: height, width: width, total: total),
                ),
              )
          ),
        ],
      ),

    );
  }
}

calculateTotal(List<Reservation> reservations){
  double total=0;
  reservations.forEach(
          (e) => total += e.price*e.reservedPlaces
  );
  return total;
}
