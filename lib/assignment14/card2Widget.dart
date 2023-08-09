import 'package:flutter/material.dart';

import 'hotelbooking.dart';

class card2Widget extends StatelessWidget {
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

  card2Widget({ required this.index}) ;

  @override
  Widget build(BuildContext context) =>
      Card(

        margin: EdgeInsets.fromLTRB(5, 0, 2, 0),

        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(3),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ), ),

            Container(
                width: 200,
                height: 80,
                child: Column(children: [
                  Align(
                      alignment:Alignment.topLeft,
                      child: Text(names[index],style:Theme.of(context).textTheme.displayMedium)),
                  Align(
                      alignment:Alignment.topLeft,
                      child: Text("A Five star hotel",style:Theme.of(context).textTheme.bodyMedium)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("\$180/night",style:Theme.of(context).textTheme.bodySmall),
                      Text("4.5",style:Theme.of(context).textTheme.bodySmall)
                    ],
                  )
                ])),

          ],), );
}

