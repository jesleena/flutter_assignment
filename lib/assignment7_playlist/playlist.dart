import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Playlist(),
  ));
}

class Playlist extends StatefulWidget {
  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  int index=0;

  var images=[
  "assets/assignment7/playlist1.jpg",
  "assets/assignment7/playlist2.jpg",
  "assets/assignment7/playlist3.jpg",
  "assets/assignment7/playlist4.jpg",
  "assets/assignment7/playlist5.jpg",
  "assets/assignment7/playlist6.jpg",
  "assets/assignment7/playlist7.jpg",
  "assets/assignment7/playlist8.jpg",
  "assets/assignment7/playlist9.jpg",
  "assets/assignment7/playlist10.jpg",
  ];

  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(

            centerTitle: false,
            title: Center(
              child: Text(
                "Playlist",
                style: GoogleFonts.lato(
                  fontSize:30,
                  color: Colors.pinkAccent,
                  fontStyle: FontStyle.italic,
                ), ),
            ),

            bottom: AppBar(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(18)
                ),
                width: double.infinity,
                height: 40,

                child:  Center(
                  child: TextField(
                  //  style: TextStyle(color: Colors.pinkAccent),
                    decoration: InputDecoration(
                        hintText: '  Search...',
                        hintStyle: TextStyle( fontStyle: FontStyle.italic,fontFamily:"GoogleFonts.lato" ,
                 fontSize: 15.0, color: Colors.pinkAccent),
                        suffixIcon: Icon(Icons.search,
                          color: Colors.pink,),
                  ), ),
              ),),
          ),),
      body:


GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1),
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    children: List.generate(10, (index) {
    return Card(
    elevation: 5.0,
    child: Image.asset(images[index]),
    );
    }),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex){
          setState((){
            index=tapindex;
          });

        },
        currentIndex: index,
        selectedItemColor: Colors.pinkAccent,
        type:BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.home),label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 0),label: "playlist"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz),label: ""),
        ],

      ),);

  }
}


