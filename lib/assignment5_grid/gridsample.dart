import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: gridSample(),
  ));
}

class gridSample extends StatelessWidget {
  @override
  List<Color> gridcolor = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.cyanAccent,
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.pink,
    Colors.yellow,
    Colors.lightBlue,
    Colors.teal,
    Colors.brown,
  ];
  static const gridicon = <IconData>[
    Icons.home,
    Icons.camera,
    Icons.video_call,
    Icons.image,
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
  ];
    Widget build(BuildContext context) {
      return Scaffold(
        body:

          GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / .55),
          shrinkWrap: true,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(12, (index) {
            return Card(
                elevation: 3.0,
                color: gridcolor[index],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 2, 30, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(gridicon[index],size: 30,),
                      Text("User $index",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],
                  ),
                ));
          } ),),
      );
    }
  }