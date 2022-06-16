
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wemove_test/models/activity.dart';

class ActivitiesService{

  static String activitiesUrl = "https://pastebin.com/raw/hwz5ffrg";

  static getActivity() async{
    try{
      var url = Uri.parse(activitiesUrl);
      print("test1");
      var response = await http.get(url);
      Activity activity = Activity.fromJson(json.decode(response.body));
      return activity;
    }
    catch(e){
      print(e);
    }


  }
}