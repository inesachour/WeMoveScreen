import 'package:flutter/material.dart';
import 'package:wemove_test/models/partner.dart';
import 'package:wemove_test/screens/panier_screen.dart';
import 'package:wemove_test/services/partners_service.dart';
import 'package:wemove_test/widgets/common/display_widgets.dart';

import '../../constants/colors.dart';

class ActivityInfoCard extends StatefulWidget {
  ActivityInfoCard({required this.name, required this.partnerId,required this.price, required this.date});

  String name;
  String partnerId;
  int? price;
  DateTime date;

  @override
  _ActivityInfoCardState createState() => _ActivityInfoCardState();
}

class _ActivityInfoCardState extends State<ActivityInfoCard> {

  Partner? partner;

  @override
  Widget build(BuildContext context) {

    Future<Partner?> futurePartner = PartnersService.getPartnerById(widget.partnerId);

    getPartner()async{
      futurePartner.then((value) {
        setState(() {
          partner = value;
        });
      });
    }

    getPartner();

    return Card(
      color: primaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    partner!= null ? Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/${partner!.logo}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ) : SizedBox(),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name,style: TextStyle(color: Colors.white),),
                        Text(partner != null ? partner!.name : "",style: TextStyle(color: Colors.white)),
                        partner!= null ? Text(partner!.geoZone.geoZoneLabel.label,style: TextStyle(color: Colors.white)) : SizedBox()
                      ],
                    ),
                  ],
                ),
                widget.price != null ? DisplayPriceWidget(text: widget.price.toString()) : SizedBox()
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_sharp, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(widget.date.toString(), style: TextStyle(color: Colors.white),)
                      ],
                    ),

                    SizedBox(height: 3,),

                    DurationWidget(start: "9", end: "10"),

                  ],
                ),

                ElevatedButton(
                  child: Text("Réserver"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PanierScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(thirdBackgroundColor),
                    fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.32,MediaQuery.of(context).size.height*0.08)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
