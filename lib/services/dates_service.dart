import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class DatesService{

  static List<String> getTime(DateTime date, int duration){
    initializeDateFormatting('fr');
    var heureDebut = DateFormat.Hm().format(date).replaceAll(':', 'H');
    var heureFin = DateFormat.Hm().format(date.add(Duration(minutes: duration))).replaceAll(':', 'H');

    return [heureDebut, heureFin];
  }

  static List<String> getShortDate(DateTime date){

    initializeDateFormatting('fr');
    var jour = capitalize(DateFormat('EEE dd',"FR-fr").format(date).replaceAll('.', ''));
    var mois = capitalize(DateFormat('MMM',"fr").format(date).replaceAll('.', ''));
    return [jour, mois];
  }

  static List<String> getLongDate(DateTime date){
    initializeDateFormatting('fr');
    var jourDuMois = capitalize(DateFormat('dd',"FR-fr").format(date).replaceAll('.', ''));
    var jourDeSemaine = capitalize(DateFormat('EEEE',"FR-fr").format(date).replaceAll('.', ''));
    var mois = capitalize(DateFormat('MMM',"fr").format(date).replaceAll('.', ''));

    var today = DateFormat('dd').format(DateTime.now());
    if(jourDuMois == today){ //TODO FIX
      jourDeSemaine = "Aujourd'hui";
    }
    else if(jourDuMois == (int.parse(today)+1).toString()){
      jourDeSemaine = "Demain";
    }

    return [jourDeSemaine,jourDuMois, mois];

  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}