
import 'package:flutter/material.dart';
import 'package:wemove_test/models/course.dart';
import 'package:wemove_test/models/reservation.dart';

class CartView extends ChangeNotifier{

  int _itemsCount=0;
  List<Reservation> _reservations= [];
  double _total = 0;

  int get itemCount => _itemsCount;
  List<Reservation> get reservations => _reservations;
  double get total => _total;

  addReservation({required Course course}){
    _reservations.add(Reservation(course: course, reservedPlaces: 1));
    calculateTotal();

  }

  clearCart(){
    _reservations = [];
    _total =0;
    notifyListeners();
  }

  calculateTotal(){
    _total = 0;
    for (var r in reservations) {
      _total += r.course.courseInfos[0].nomadPrice!= null ? r.course.courseInfos[0].nomadPrice! * r.reservedPlaces : 0;
    }
    notifyListeners();
  }

}