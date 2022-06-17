import 'package:wemove_test/models/course.dart';

class Reservation{

  Reservation({
    required this.course,
    required this.reservedPlaces
  });

  Course course;
  int reservedPlaces;

}