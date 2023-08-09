import 'package:flutter/material.dart';

import 'hotelbooking.dart';

class card1Widget extends StatelessWidget {
  final int index;

  var names = [
    "Crown Plaza",
    "HolidayInn",
    "Marriot",
    "Le Meridian",
    "Taj",

  ];
  var images = [
    "assets/assignment14/crownplaza.jpg",
    "assets/assignment14/holidayinn.jpg",
    "assets/assignment14/marriot.jpg",
    "assets/assignment14/meridian.jpg",
    "assets/assignment14/taj.jpg",

  ];

  card1Widget({ required this.index}) ;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.all(3),
    child: Row
      (children: [
      Container(
        margin: EdgeInsets.all(3),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft:Radius.circular(10.0) ),
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ), ),

      Container(
          width: 135,
          height: 100,
          child: Column(children: [
            Align(
                alignment:Alignment.topLeft,
                child: Text(names[index],style:Theme.of(context).textTheme.displayMedium)),
            Align(
                alignment:Alignment.topLeft,
                child: Text("A Five star hotel",style:Theme.of(context).textTheme.bodyMedium)),
            Align(
              alignment:Alignment.topLeft,
              child:
              Text("\$180/night",style:Theme.of(context).textTheme.bodySmall),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.car_rental,color: Colors.blue,),
                Icon(Icons.bed_sharp,color: Colors.blue),
                Icon(Icons.no_drinks_outlined,color: Colors.blue,),
                Icon(Icons.wifi,color: Colors.blue,),

              ],
            )
          ])),
      ElevatedButton(onPressed: (){}, child:Text("book now"))

    ],),
  );
}

