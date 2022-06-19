import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/core/models/course.dart';
import 'package:wemove_test/core/models/partner.dart';
import 'package:wemove_test/ui/screens/panier_screen.dart';
import 'package:wemove_test/core/services/dates_service.dart';
import 'package:wemove_test/core/services/partners_service.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';
import 'package:wemove_test/ui/widgets/common/display_widgets.dart';

import '../../../constants/colors.dart';

class CourseCard extends StatefulWidget {
  CourseCard({required this.course});

  Course course;

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {

  Partner? partner;

  @override
  Widget build(BuildContext context) {

    List<String> duration = DatesService.getTime(widget.course.courseInfos[0].date, widget.course.duration);

    Future<Partner?> futurePartner = PartnersService.getPartnerById(widget.course.partnerId);

    getPartner()async{
      futurePartner.then((value) {
        if(mounted && partner == null){
          setState(() {
            partner = value;
          });
        }

      });
    }

    getPartner();

    List<String> date = DatesService.getLongDate(widget.course.courseInfos[0].date);

    return Card(
      color: primaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: partner != null
            ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/${partner!.logo}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.course.courseInfos[0].title,style: TextStyle(color: Colors.white),),
                        Text(partner != null ? partner!.name : "",style: TextStyle(color: Colors.white)),
                        partner!= null ? Text(partner!.geoZone.geoZoneLabel.label,style: TextStyle(color: Colors.white)) : SizedBox()
                      ],
                    ),
                  ],
                ),
                widget.course.courseInfos[0].nomadPrice != null ? PriceWidget(text: widget.course.courseInfos[0].nomadPrice.toString()) : SizedBox()
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
                        Text("${date[0]} le ${date[1]} ${date[2]}" , style: TextStyle(color: Colors.white),)
                      ],
                    ),

                    SizedBox(height: 3,),

                    DurationWidget(start: duration[0], end: duration[1]),

                  ],
                ),

                ElevatedButton(
                  child: Text("Réserver"),
                  onPressed: (){
                    Provider.of<CartView>(context,listen: false).addReservation(course: widget.course, passPrice: widget.course.daypassOnly == 1 ? partner!.passPrice : widget.course.courseInfos[0].nomadPrice);
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
        )
            : SizedBox(),
      ),
    );
  }
}
