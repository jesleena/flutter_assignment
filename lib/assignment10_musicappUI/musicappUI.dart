import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
        displayLarge: TextStyle(fontSize:45, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Color(0xFFF48FB1),fontStyle: FontStyle.italic),
        titleLarge: TextStyle(fontSize: 25,fontFamily:'Amaranth', color:Color(0xFFF48FB1),fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 20,fontFamily:'Amaranth',color:Color(0xFFF48FB1) ),
          bodySmall :TextStyle(fontSize: 20,fontFamily:'Amaranth',),
      )
    ),
    home: MusicUI(),
  ));
}

class MusicUI extends StatefulWidget {
  @override
  State<MusicUI> createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  @override
  int index = 0;
  var names = [
    "Hero",
    "unholy",
    "lift me up",
    "depression",
    "i'm good",
    "i love God",
    "happiness",
    "breeze",
    "depression",
    "i'm good",
  ];
  var artists = [
    "Tailor Swift",
    "Sam Smith",
    "Rihanna",
    "Dax",
    "David guetta",
    "i love God",
    "happiness",
    "breeze",
    "depression",
    "i'm good",
  ];
  var images = [
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
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(

          title: Text(
            "Musify ",style: Theme.of(context).textTheme.displayLarge,
          ),),

          ),
        SliverToBoxAdapter(
          child:SizedBox(
            height: 80,
            child: Text(
              '  \n   Playlist ',style: Theme.of(context).textTheme.titleLarge,
            ),
          ),),
        SliverToBoxAdapter(
          child: Container(
             height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(3),
                  width: 200,
                  height: 200,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ), ); },
            ),
          ),
        ),

SliverToBoxAdapter(
  child:SizedBox(
    height: 80,
    child: Text(
      '  \n   Recommended for you  ',style: Theme.of(context).textTheme.titleLarge,
      ),
  ),),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) =>  SizedBox(
    height: 100,
    width: 300,
    child: ListTile(
    leading: Container(
      margin: EdgeInsets.all(3),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(images[index]),
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Column( crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(names[index],style: Theme.of(context).textTheme.bodyMedium,),
    Text(artists[index],),
    ]
    ),

    trailing:  SizedBox(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Icon(Icons.star_border_outlined,color: Colors.pink[200]),
      Icon(Icons.download_outlined,color: Colors.pink[200]),
      ]),
    )
    ),),
            childCount: images.length,
          ),
        ),
        ]
    ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.pinkAccent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 0), label: "Home "),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}


