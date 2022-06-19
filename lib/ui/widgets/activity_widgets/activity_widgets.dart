
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/ui/screens/cart_screen.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
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

Widget IdealForText({required String label}){
  return Row(
    children: [
      Icon(Icons.check, color: Colors.white,),
      SizedBox(width: 5,),
      Expanded(
          child: Text(
              label,
              style: TextStyle(color: Colors.white)
          )
      ),
    ],
  );
}

Widget RecommendationText({required String label}){
  return Row(
    children: [
      Icon(
        Icons.close,
        color: Colors.white,
      ),
      SizedBox(width: 5,),
      Expanded(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      )
    ],
  );
}

Widget AccessibilityText({required String level}){
  return Row(
    children: [
      Icon(Icons.signal_cellular_alt_outlined, color: Colors.white,),
      SizedBox(width: 5,),
      Expanded(
          child: Text(
              level,
              style: TextStyle(color: Colors.white)
          )
      )
    ],
  );
}
