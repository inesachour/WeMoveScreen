import 'package:flutter/material.dart';
import 'package:wemove_test/constants/colors.dart';
import 'package:wemove_test/core/models/activity.dart';
import 'package:wemove_test/core/models/course.dart';
import 'package:wemove_test/core/services/activities_service.dart';
import 'package:wemove_test/core/services/courses_service.dart';
import 'package:wemove_test/ui/widgets/activity_widgets/activity_infos_widget.dart';
import 'package:wemove_test/ui/widgets/activity_widgets/course_card.dart';
import 'package:wemove_test/ui/widgets/activity_widgets/activity_widgets.dart';

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
      if(mounted){
        setState(() {
          activity = value;
        });
      }

    });
    coursesFuture.then((value) {
      if(mounted){
        setState(() {
          courses = value;
        });
      }
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
                      child: ActivityInfos(activity: activity!, context: context)
                    ),

                    Expanded(
                      flex: 3,
                      child: courses != null ? ListView.builder(
                          itemCount: courses!.length,
                          itemBuilder: (context,index){
                            return CourseCard(
                              course: courses![index],
                            );
                          }
                      )
                      : Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                top: 0,
                child: ActivityAppBarWidget(context: context)
            )
          ],
        ) : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
