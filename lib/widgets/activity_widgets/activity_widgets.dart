
import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';

Widget ActivityAppBarWidget({required double width}){
  return Positioned(
      width: width,
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 50,
            height: 50,
            child: Icon(Icons.arrow_back, color: Colors.white,),
            decoration: BoxDecoration(
                color: secondaryBackgroundColor,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 50,
            height: 50,
            child: Icon(Icons.shopping_cart_sharp, color: Colors.white,),
            decoration: BoxDecoration(
                color: secondaryBackgroundColor,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ],
      )
  );
}