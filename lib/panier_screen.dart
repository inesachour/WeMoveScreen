import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/constants/reservations.dart';
import 'package:wemove_test/reservation_card.dart';

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


    return Scaffold(
      appBar: AppBar(
        title: Text("Mon panier"),
        leading: ElevatedButton(
          child: Icon(Icons.arrow_back), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(secondaryBackgroundColor),
          ),
          onPressed: (){},
        ),
        backgroundColor: primaryBackgroundColor,
        elevation: 0,

      ),
      body: Container(
        color: primaryBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      SizedBox(
                          width: width,
                          child: Text("batata", textAlign: TextAlign.left,style: TextStyle(color: Colors.white,),)
                      ),
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

              Expanded(
                flex: 7,
                child: reservations.length > 0 ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: reservations.length,
                    itemBuilder: (context, index){
                      return Dismissible(
                        key: Key(reservations[index].id.toString()),
                        child: ReservationCard(reservation: reservations[index],deleting: (){
                          setState(() {
                            reservations.removeAt(index);
                          });
                        },),
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
                )
                ,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
