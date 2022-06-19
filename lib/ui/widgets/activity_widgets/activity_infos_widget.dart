import 'package:flutter/material.dart';
import 'package:wemove_test/core/models/activity.dart';
import 'package:wemove_test/ui/widgets/activity_widgets/activity_widgets.dart';

Widget ActivityInfos({required Activity activity, required BuildContext context,}){
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${activity.image1}"),
            opacity: 0.75,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.srcOver
            ),
          ),
        ),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height*0.13,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(activity.name, style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
              Text(activity.description, style: TextStyle(color: Colors.white, fontSize: 16 ,fontWeight: FontWeight.w400),),

              SizedBox(height: MediaQuery.of(context).size.height*0.016,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.14,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context,index){
                                return IdealForText(label: activity.idealFor[index].label);
                              },
                              itemCount: activity.idealFor.length,
                            ),
                            flex: 1,
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context,index){
                                return RecommendationText(label: activity.recommendations[index].label);
                              },
                              itemCount: activity.recommendations.length,
                            ),
                            flex: 1,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: AccessibilityText(level: activity.getAccessibilityLevel())

                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            ],
          ),
        ),
      ),
    ],
  );
}