import 'package:flutter/material.dart';
import 'package:wemove_test/screens/panier_screen.dart';
import 'package:wemove_test/widgets/common/display_widgets.dart';

import '../../constants/colors.dart';

class ActivityInfoCard extends StatefulWidget {
  const ActivityInfoCard({Key? key}) : super(key: key);

  @override
  _ActivityInfoCardState createState() => _ActivityInfoCardState();
}

class _ActivityInfoCardState extends State<ActivityInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/partners/6723suNIxH2F1aZVnMSS.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cours Name",style: TextStyle(color: Colors.white),),
                        Text("Partenaire Name",style: TextStyle(color: Colors.white)),
                        Text("Zone",style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ],
                ),
                DisplayPriceWidget(text: "20")
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_sharp, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("date", style: TextStyle(color: Colors.white),)
                      ],
                    ),

                    SizedBox(height: 3,),

                    DurationWidget(start: "9", end: "10"),

                  ],
                ),

                ElevatedButton(
                  child: Text("Réserver"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PanierScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(thirdBackgroundColor),
                    fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.32,MediaQuery.of(context).size.height*0.08)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
