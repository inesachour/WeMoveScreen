import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/view_models/cart_view.dart';
import 'package:wemove_test/widgets/common/display_widgets.dart';

Widget BottomNavBar({required double height, required double width}){
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

          Consumer<CartView>(
          builder: (context,cart,child){
            return PriceWidget(
                text: cart.total.toStringAsFixed(2),
                fontWeight: FontWeight.w700,
                fontSizeMainText: 24,
                fontSizeCurrency: 14
            );
          }
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