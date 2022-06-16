import 'package:flutter/material.dart';

var reservations = [
  Reservation(
      title: "Cardio",
      place: "California Gym",
      price: 10,
      date: DateTime.now(),
      reservedPlaces: 1,
      image: "assets/images/cardio.jpg",
      heureDebut: "14:00",
      heureFin: "15:00"
  ),
  Reservation(
      title: "Musculation",
      place: "Exhale Club",
      price: 12,
      date: DateTime(2022,4,29),
      reservedPlaces: 1,
      image: "assets/images/musculation.jpg"
  ),
  Reservation(
      title: "Spinning",
      place: "California Gym",
      price: 12,
      date: DateTime(2022,4,30),
      reservedPlaces: 2,
      image: "assets/images/spinning.jpg"
  ),
  Reservation(
      title: "Body Pump",
      place: "Gym Box",
      price: 10,
      date: DateTime(2022,4,29),
      reservedPlaces: 1,
      image: "assets/images/bodypump.jpg",
      heureDebut: "19:00",
      heureFin: "21:00"
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
    this.heureDebut,
    this.heureFin,
  });

  int id= _id++;
  String title;
  String place;
  double price;
  DateTime date;
  String? time;
  int reservedPlaces;
  String image;
  String? heureDebut;
  String? heureFin;

}
