import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Jeu 10", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                          Text("Fév", style: TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      )
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){},
                  ),
                ],
              ),
              Text("Day Mega Passage", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
              Text("Lyon Sport", style: TextStyle(color: Colors.white, fontSize: 15)),
              Text("de 1h à 7h", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700)),
              Text("Places réservés", style: TextStyle(color: Colors.white, fontSize: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("price", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      TextButton(
                        child: Text("-"),
                        onPressed: (){},
                      ),
                      Text("0", style: TextStyle(color: Colors.white)),
                      TextButton(
                        child: Text("+"),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
