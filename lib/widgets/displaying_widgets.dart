import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';

//increment and drecrement button of reserved places
Widget incdecButton ({required Color color, required String text, required onPressed }){
  return SizedBox(
    width: 40,
    child: ElevatedButton(
      child: Text(text, style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(color),
      ),
      onPressed: onPressed,
    ),
  );
}

//Widget of course/reservation duration
Widget DurationWidget({required String duree}){
  return Row(
    children: [
      Icon(Icons.watch_later, color: Colors.white,),
      SizedBox(width: 5,),
      Text(
          duree,
          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700)
      ),
    ],
  );
}

//Widget displaying price
Widget DisplayPrice({required String text, double fontSizeMainText = 22, FontWeight fontWeight = FontWeight.w700, double fontSizeCurrency = 14}){
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