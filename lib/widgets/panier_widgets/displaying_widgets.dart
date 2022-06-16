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