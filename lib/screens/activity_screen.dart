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
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/activity/9Z6IJiAkLOGqmWA5psXv.jpg"),
                                opacity: 0.75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Activity Name", style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("Description Name", style: TextStyle(color: Colors.white, fontSize: 16 ,fontWeight: FontWeight.w400),),

                                  SizedBox(height: 10,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.check, color: Colors.white,),
                                                SizedBox(width: 5,),
                                                Text("text1",style: TextStyle(color: Colors.white))
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Icon(Icons.close, color: Colors.white,),
                                                SizedBox(width: 5,),
                                                Text("text2",style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(Icons.check, color: Colors.white,),
                                            SizedBox(width: 5,),
                                            Text("text1",style: TextStyle(color: Colors.white))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 3,
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
