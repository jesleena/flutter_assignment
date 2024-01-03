import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: WhatsApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class WhatsApp extends StatelessWidget {
  var names=['Ann','Jane','Eimy','Rob','Sheza','Noah','Ann','Jane','Eimy','Rob','Sheza','Noah'];
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
    "assets/assignment3/pic12.jpg",];
  var time=["10.30","10.00","9.30","9.00","8.55","8.45","8.00","yesterday","yesterday","yesterday","yesterday","yesterday"];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(


        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 45.0),
              child: Icon(Icons.camera_alt),
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            const Icon(Icons.search_rounded),
            const SizedBox(
              width: 30,
            ),
            PopupMenuButton(itemBuilder: (context){
              return[

                const PopupMenuItem(child: Text("New group")),
                const PopupMenuItem(child: Text("New broadcast")),
                const PopupMenuItem(child: Text("Linked devices")),
                const PopupMenuItem(child: Text("Starred messages")),
                const PopupMenuItem(child: Text("Payment")),
                const PopupMenuItem(child: Text("Settings")),
              ];

            })
          ],
          bottom:
          TabBar(
            tabs: [
              Tab(
                  child: Text(
                    'Chats',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
              Tab(
                  child: Text(
                    'Status',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
              Tab(
                  child: Text(
                    'Calls',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ],
          ),
        ),


        body:
        TabBarView(
            children: [
              ListView(children:List.generate(12,(index) => ListTile(
                leading: CircleAvatar(   backgroundImage: AssetImage(images[index])),
                title: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
                    const Icon(
                      Icons.done_all,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
                trailing: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(time[index]),
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 10,
                      child: Text("2"),),
                  ],
                ),

              ))),
              ListView(children:List.generate(12,(index) => ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(images[index])),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
                    Text(time[index],style: GoogleFonts.lato(fontSize: 10,fontStyle: FontStyle.italic,)),
                  ],
                ),
              ))),
              ListView(children:List.generate(12,(index) => ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(images[index])),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
                    Text(time[index],style: GoogleFonts.lato(fontSize: 10,fontStyle: FontStyle.italic,)),
                  ],
                ),

              ))),
            ]
        ),

      ),
    );
  }
}
