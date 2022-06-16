import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/widgets/common/display_widgets.dart';
import 'package:wemove_test/widgets/panier_widgets/displaying_widgets.dart';

Widget BottomNavBar({required double height, required double width, required double total}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.start,
          ),

          DisplayPriceWidget(
              text: total.toStringAsFixed(2),
              fontWeight: FontWeight.w700,
              fontSizeMainText: 24,
              fontSizeCurrency: 14
          ),
        ],
      ),
      ElevatedButton(
        child: Text("Continuer"),
        onPressed: (){},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(thirdBackgroundColor),
            fixedSize: MaterialStateProperty.all(Size(width*0.32,height*0.08)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
        ),
      )
    ],
  );
}