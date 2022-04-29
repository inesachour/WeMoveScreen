

import 'package:flutter/material.dart';


var reservations = [
  Reservation(
      title: "Cuisses Abdos Fessiers",
      place: "Lyon Sport",
      price: 8.00,
      date: DateTime(17082000),
      reservedPlaces: 0,
      image: "assets/image.jpg"
  ),
  Reservation(
      title: "Cuisses Fessiers",
      place: "Task Sport",
      price: 8.00,
      date: DateTime(17082000),
      reservedPlaces: 0,
      image: "assets/image.jpg"
  ),
  Reservation(
      title: "Fessiers",
      place: "Lyon",
      price: 8.00,
      date: DateTime(17082000),
      reservedPlaces: 0,
      image: "assets/image.jpg"
  ),
  Reservation(
      title: "Cuisses Abdos Fessiers",
      place: "Lyon Sport",
      price: 8.00,
      date: DateTime(17082000),
      reservedPlaces: 2,
      image: "assets/image.jpg"
  ),
  Reservation(
      title: "Cuisses Abdos Fessiers",
      place: "Lyon Sport",
      price: 8.00,
      date: DateTime(17082000),
      reservedPlaces: 5,
      image: "assets/image.jpg"
  ),
];


class Reservation extends ChangeNotifier{

  static var _id = 0;

  Reservation({
    required this.title,
    required this.place,
    required this.price,
    required this.date,
    this.time,
    required this.reservedPlaces,
    required this.image,
  });

  int id= _id++;
  String title;
  String place;
  double price;
  DateTime date;
  String? time;
  int reservedPlaces;
  String image;

}



