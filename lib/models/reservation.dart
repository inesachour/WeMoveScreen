class Reservation{

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