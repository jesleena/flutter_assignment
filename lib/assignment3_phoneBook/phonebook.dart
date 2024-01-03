import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: contactList(),
    debugShowCheckedModeBanner: false,
  ));
}
class contactList extends StatelessWidget {

  var names=['Ann','Jane','Eimy','Rob','Sheza','Noah','Hyder','Gia','Azam','Arhaam','Inaya','Ayra'];
  var images=[
    "assets/assignment3/pic1.jpg",
    "assets/assignment3/pic2.jpg",
    "assets/assignment3/pic3.jpg",
    "assets/assignment3/pic4.jpg",
    "assets/assignment3/pic5.jpg",
    "assets/assignment3/pic6.jpg",
    "assets/assignment3/pic7.jpg",
    "assets/assignment3/pic8.jpg",
    "assets/assignment3/pic9.jpg",
    "assets/assignment3/pic10.jpg",
    "assets/assignment3/pic11.jpg",
    "assets/assignment3/pic12.jpg",
  ];
  var time=["10.30","10.00","9.30","9.00","8.55","8.45","8.00","yesterday","yesterday","yesterday","yesterday","yesterday"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Contacts",style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,))),
      body:  ListView(
          children:List.generate(12,(index) => Card(child:
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
                leading:  CircleAvatar(
                    backgroundImage: AssetImage(images[index])),
                title:
                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
                 subtitle:
                    Text('9876543210',style: GoogleFonts.lato(fontSize: 15,fontStyle: FontStyle.italic,)),


                trailing: const Icon(Icons.navigate_next)
            ),
          ),)
          )),);

  }
}
