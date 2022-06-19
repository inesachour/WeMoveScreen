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

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      body: SafeArea(
        child: FutureBuilder<Activity?>(
          future: ActivitiesService.getActivity(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: ActivityInfos(activity: snapshot.data!, context: context)
                          ),

                          Expanded(
                            flex: 3,
                            child: FutureBuilder<List<Course>?>(
                              future: CoursesService.getCourses(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(child: CircularProgressIndicator());
                                }
                                else{
                                  return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context,index){
                                        return CourseCard(
                                          course: snapshot.data![index],
                                        );
                                      }
                                  );
                                }
                              },
                            )
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
              );
            }
          },
        ),
      ),
    );
  }
}
