import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';
import 'package:wemove_test/ui/widgets/common/display_widgets.dart';

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

Widget TopPartPanier({required double width, required double height, required BuildContext context}){
  return Expanded(
    flex: 2,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          SizedBox(height: 8,),
          SizedBox(
              width: width,
              child: Text(
                "Cette réservation n'est pas pour toi? Après avoir finalisé l'achat, tu pourras modifier le bénéficiaire de chaque accès en indiquant son nom.",
                textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 14),)
          ),
          SizedBox(height: 8,),
          SizedBox(
            width: width,
            child: InkWell(
              child: Text(
                  "Vider le panier",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 16,decoration: TextDecoration.underline)
              ),
              onTap: (){
                Provider.of<CartView>(context,listen: false).clearCart();
              },
            ),
          ),
        ],
      ),
    ),
  );
}