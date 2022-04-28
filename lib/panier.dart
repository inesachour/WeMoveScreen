import 'package:flutter/material.dart';
import 'package:wemove_test/reservation_card.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key}) : super(key: key);

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon panier"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Text("batata"),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return ReservationCard();
              }
          ),
          Text("ofkfdkfdkfgfkmgkml")
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ok"),
            ElevatedButton(child: Text("ok"),onPressed: (){},)
          ],
        ),
      )
    );
  }
}
