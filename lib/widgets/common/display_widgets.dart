
import 'package:flutter/material.dart';

Widget DurationWidget({required String start,required String end}){
  return Row(
    children: [
      Icon(Icons.watch_later, color: Colors.white,),
      SizedBox(width: 5,),
      Text(
          "De $start à $end",
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700)
      ),
    ],
  );
}

//Widget displaying price
Widget DisplayPriceWidget({required String text, double fontSizeMainText = 22, FontWeight fontWeight = FontWeight.w700, double fontSizeCurrency = 14}){
  return RichText(
    text: TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.white, fontSize: fontSizeMainText, fontWeight: fontWeight),
        children: <TextSpan>[
          TextSpan(text: ' DT',
            style: TextStyle(
                color: Colors.white, fontSize: fontSizeCurrency),
          )
        ]
    ),
  );
}