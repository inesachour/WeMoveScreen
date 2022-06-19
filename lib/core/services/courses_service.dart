
import 'dart:convert';

import 'package:wemove_test/core/models/course.dart';
import 'package:http/http.dart' as http;

class CoursesService{

  static String coursesUrl = "https://pastebin.com/raw/D3HSsvZz";

  static Future<List<Course>?> getCourses() async{
    try{
      var url = Uri.parse(coursesUrl);
      var response = await http.get(url);
      List<Course> courses = courseFromJson(response.body);
      return courses;
    }
    catch(e){
      print(e);
    }
  }
}