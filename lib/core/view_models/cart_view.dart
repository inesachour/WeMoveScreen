
import 'package:flutter/material.dart';
import 'package:wemove_test/core/models/course.dart';
import 'package:wemove_test/core/models/reservation.dart';

class CartView extends ChangeNotifier{

  int _itemsCount=0;
  List<Reservation> _reservations= [];
  double _total = 0;

  int get itemCount => _itemsCount;
  List<Reservation> get reservations => _reservations;
  double get total => _total;

  addReservation({required Course course, required int? passPrice}){
    bool inCart = false;
    for(var r in _reservations){
      if(r.course.id == course.id){
        inCart = true;
      }
    }
    if(inCart){
      Reservation r = _reservations.firstWhere((element) => element.course.id == course.id);
      if(r.reservedPlaces < course.courseInfos[0].stock){
        r.reservedPlaces++;
        calculateTotal();
      }
    }
    else{
      if(course.courseInfos[0].stock >= 1){
        if(course.daypassOnly==1){
          _reservations.add(Reservation(course: course, reservedPlaces: 1,passPrice: passPrice));
        }
        else{
          _reservations.add(Reservation(course: course, reservedPlaces: 1,passPrice: null));
        }
        calculateTotal();
      }
    }
  }

  deleteReservation({required Reservation reservation}){
    _reservations.removeWhere((element) => element.course.id == reservation.course.id);
    calculateTotal();

  }

  incrementReservationsPlaces({required Reservation reservation}){
    _reservations.forEach((element) {
      if(element.course.id == reservation.course.id && element.reservedPlaces < reservation.course.courseInfos[0].stock){
        element.reservedPlaces++;
        calculateTotal();
      }
    });
  }

  decrementReservationsPlaces({required Reservation reservation}){
    _reservations.forEach((element) {
      if(element.course.id == reservation.course.id){
        element.reservedPlaces--;
        calculateTotal();
      }
    });
  }

  clearCart(){
    _reservations = [];
    _total =0;
    calculateTotal();
  }

  calculateTotal(){
    _total = 0;
    for (var r in reservations) {
      if(r.course.daypassOnly == 0){
        _total += r.course.courseInfos[0].nomadPrice! * r.reservedPlaces;
      }
      else{
        _total += r.passPrice! * r.reservedPlaces;
      }
    }
    notifyListeners();
  }


}