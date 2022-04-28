import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("test test"),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){},
                ),
              ],
            ),
            Text("test test"),
            Text("test test"),
            Text("test test"),
            Row(
              children: [
                Text("price"),
                Text("buttons + -")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
