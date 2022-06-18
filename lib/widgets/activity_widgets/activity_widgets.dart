
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/screens/panier_screen.dart';
import 'package:wemove_test/view_models/cart_view.dart';

Widget ActivityAppBarWidget({required BuildContext context}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.all(5),
        width: 50,
        height: 50,
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            color: secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        width: 50,
        height: 50,
        child: IconButton(
          icon: Badge(
            child: Icon(Icons.shopping_cart_sharp, color: Colors.white,),
            badgeContent: Consumer<CartView>(
                builder: (context,cart,child){
                  return Text(cart.reservations.length.toString(), style: TextStyle(color: Colors.white,fontSize: 10),);
                },
            ),
            badgeColor: thirdBackgroundColor,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PanierScreen()));
          },
        ),

        decoration: BoxDecoration(
            color: secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    ],
  );
}