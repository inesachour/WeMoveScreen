
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wemove_test/core/models/activity.dart';

class ActivitiesService{

  static String activitiesUrl = "https://pastebin.com/raw/hwz5ffrg";

  static Future<Activity?> getActivity() async{
    try{
      var url = Uri.parse(activitiesUrl);
      var response = await http.get(url);
      Activity activity = Activity.fromJson(json.decode(response.body));
      return activity;
    }
    catch(e){
      print(e);
    }
  }
}