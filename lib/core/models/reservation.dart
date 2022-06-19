import 'package:wemove_test/core/models/course.dart';

class Reservation{

  Reservation({
    required this.course,
    required this.reservedPlaces,
    required this.passPrice
  });

  Course course;
  int reservedPlaces;
  int? passPrice;

}