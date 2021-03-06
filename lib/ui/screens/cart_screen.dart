import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';
import 'package:wemove_test/ui/widgets/cart_widgets/cart_widgets.dart';
import 'package:wemove_test/ui/widgets/cart_widgets/reservation_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      //APPBAR
      appBar: AppBar(
        title: Text("Mon panier", style: TextStyle(fontWeight: FontWeight.w700),),
        leading: Container(
          margin: EdgeInsets.all(5),
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
          ),
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
                  TopPartPanier(width: width, height: height, context: context),

                  //Reservations List
                  Consumer<CartView>(
                    builder: (context,cart,child){
                      return Expanded(
                        flex: 7,
                        child: cart.reservations.length > 0 ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cart.reservations.length,
                            itemBuilder: (context, index){
                              return Dismissible(
                                key: Key(cart.reservations[index].course.id.toString()),
                                child: ReservationCard(
                                  reservation: cart.reservations[index],
                                ),
                                onDismissed: (direction) {
                                  Provider.of<CartView>(context, listen: false).deleteReservation(reservation: cart.reservations[index]);
                                },
                              );
                            }
                        ) : SizedBox.expand(
                            child: Center(
                                child: Text("Pas encore d'endorphines par ici",
                                  style: TextStyle(color: Colors.white, fontSize: 18),)
                            )
                        ),
                      );
                    },
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
                  child: BottomNavBar(
                      height: height,
                      width: width,
                  )
                ),
              )
          ),
        ],
      ),

    );
  }
}

