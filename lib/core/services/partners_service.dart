
import 'package:wemove_test/core/models/partner.dart';
import 'package:http/http.dart' as http;

class PartnersService{

  static String partnersUrl = "https://pastebin.com/raw/ydHrfkWP";

  static Future<Partner?> getPartnerById(String id) async {
    try{
      var url = Uri.parse(partnersUrl);
      var response = await http.get(url);
      List<Partner> partners = partnersFromJson(response.body).partners;
      Partner? partner = partners.firstWhere((element) => element.id==id);
      return partner;
    }
    catch(e){
      print(e);
    }
  }
}