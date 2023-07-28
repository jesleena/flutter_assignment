import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: listView_seperator(),
    debugShowCheckedModeBanner: false,
  ));
}

class listView_seperator extends StatelessWidget {
  var names = [
    'Ann',
    'Jane',
    'Eimy',
    'Rob',
    'Sheza',
    'Noah',
    'Ann',
    'Jane',
    'Eimy',
    'Rob',
    'Sheza',
    'Noah'
  ];
  var images = [
    "assets/assignment4/icon1.png",
    "assets/assignment4/icon2.png",
    "assets/assignment4/icon3.png",
    "assets/assignment4/icon4.png",
    "assets/assignment4/icon5.png",
    "assets/assignment4/icon6.png",
    "assets/assignment4/icon1.png",
    "assets/assignment4/icon2.png",
    "assets/assignment4/icon3.png",
    "assets/assignment4/icon4.png",
    "assets/assignment4/icon5.png",
    "assets/assignment4/icon6.png",
  ];

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "list Seperator",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (c, index) {
            return Card(
              child: Row(
                children: [
                  Text(names[index],
                      style:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 30)),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(images[index]))
                ],
              ),
              elevation: 5,
            );
          },
          separatorBuilder: (context, index) {
            if (index % 4 == 0) {
              return Card(
                child: Text("Advertisement",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 50,
                        color: Colors.white)),
                color: Colors.pink[200],
                elevation: 5,
              );
            } else
              return Text("");
          },
          itemCount: 12),
    );
  }
}
