import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';

Widget incdecButton ({required Color color, required String text}){
  return SizedBox(
    width: 40,
    child: ElevatedButton(
      child: Text(text, style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(color),
      ),
      onPressed: (){},
    ),
  );
}