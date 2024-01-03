import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: Gridview1(),));
}
class Gridview1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400),
          children:List.generate(30, (index) => Card(
            child: Image.asset("assets/pic1.jpg"),))),

      // GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 30),
      // children:List.generate(30, (index) => Card(
      //   child: Image.asset("assets/pic1.jpg"),))),
    );
  }
}
