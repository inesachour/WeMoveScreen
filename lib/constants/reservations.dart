

import 'package:flutter/material.dart';


var reservations = [
  Reservation(
      title: "Cuisses Abdos Fessiers",
      place: "Lyon Sport",
      price: 8,
      date: DateTime.now(),
      reservedPlaces: 1,
      image: "assets/images/gym.jpg"
  ),
  Reservation(
      title: "Cardio",
      place: "California Gym",
      price: 10,
      date: DateTime.now(),
      reservedPlaces: 1,
      image: "assets/images/cardio.jpg"
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
      title: "Spinnig",
      place: "California Gym",
      price: 12,
      date: DateTime(2022,4,30),
      reservedPlaces: 2,
      image: "assets/images/spinning.jpg"
  ),
  Reservation(
      title: "Zumba",
      place: "Gym Box",
      price: 10,
      date: DateTime(2022,4,29),
      reservedPlaces: 1,
      image: "assets/images/zumba.jpg",
      heureDebut: "19:00",
      heureFin: "23:00"
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



