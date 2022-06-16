import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/widgets/activity_widgets/activity_info_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/activity/9Z6IJiAkLOGqmWA5psXv.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context,index){
                            return ActivityInfoCard();
                          }

                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
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
            ),
          ],
        ),
      ),
    );
  }
}
