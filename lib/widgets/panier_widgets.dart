import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';

Widget BottomNavBar({required double height, required double width, required double total}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text("Total", style: TextStyle(color: Colors.white), textAlign: TextAlign.start,),
          RichText(
            text: TextSpan(
                text: total.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(text: 'DT',
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  )
                ]
            ),
          ),
        ],
      ),
      ElevatedButton(
        child: Text("Continuer"),
        onPressed: (){},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(thirdBackgroundColor),
            fixedSize: MaterialStateProperty.all(Size(width*0.32,height*0.08)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ))
        ),
      )
    ],
  );
}