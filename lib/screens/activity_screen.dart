import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/models/activity.dart';
import 'package:wemove_test/models/course.dart';
import 'package:wemove_test/services/activities_service.dart';
import 'package:wemove_test/services/courses_service.dart';
import 'package:wemove_test/widgets/activity_widgets/activity_info_card.dart';
import 'package:wemove_test/widgets/activity_widgets/activity_widgets.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Future<Activity?> activityFuture = ActivitiesService.getActivity();
  Future<List<Course>?> coursesFuture = CoursesService.getCourses();

  Activity? activity;
  List<Course>? courses;

  Future getData() async{
    activityFuture.then((value) {
      setState(() {
        activity = value;
      });
    });
    coursesFuture.then((value) {
      setState(() {
        courses = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    getData();

    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      body: SafeArea(
        child: activity != null ? Stack(
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
                                image: AssetImage("assets/images/activities/9Z6IJiAkLOGqmWA5psXv.jpg"), //TODO DYNAMIC
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
                                  Text(activity!.name, style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text(activity!.description, style: TextStyle(color: Colors.white, fontSize: 16 ,fontWeight: FontWeight.w400),),

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
                      child: courses != null ? ListView.builder(
                          itemCount: courses!.length,
                          itemBuilder: (context,index){
                            return ActivityInfoCard(
                              course: courses![index],
                            );
                          }
                      )
                      : CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
            ),
            ActivityAppBarWidget(width: MediaQuery.of(context).size.width)
          ],
        ) : CircularProgressIndicator()
      ),
    );
  }
}
