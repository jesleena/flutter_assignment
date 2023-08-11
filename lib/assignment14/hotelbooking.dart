import 'package:flutter/material.dart';
import 'package:flutter_assignment/assignment14/card1Widget.dart';
import 'package:flutter_assignment/assignment14/card2Widget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 25, color:Colors.black,fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 20, color:Colors.black),
          bodyMedium: TextStyle(fontSize: 18,color:Colors.grey),
          bodySmall :TextStyle(fontSize: 18,color:Colors.blue ),
        )
    ),
    home: hotelbooking(),
  ));
}
class hotelbooking extends StatefulWidget {
  const hotelbooking({Key? key}) : super(key: key);

  @override
  State<hotelbooking> createState() => _hotelbookingState();
}

class _hotelbookingState extends State<hotelbooking> {

  @override
 int index = 0;



  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white60,
          floating: true,
           title:Column(
            children: [
              Align(
                alignment:Alignment.topLeft,
                child: Text(
                  "hello@arjun",style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Find your favourite Hotel",style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
              child: ClipRRect(
                  borderRadius:BorderRadius.circular(12),
                  child: Image.asset("assets/assignment14/img.png")),
            ),
          ],
          bottom: AppBar(
            elevation: 5,
            backgroundColor: Colors.white60,
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(18),
              ),
              child:  Center(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' Search for Hotel',
                    hintStyle: TextStyle(  fontSize: 15.0, color: Colors.grey),
                    suffixIcon: Icon(Icons.search,
                      color: Colors.grey,),
                  ),
          ))))),

        SliverToBoxAdapter(
          child:Container(
            margin: EdgeInsets.all(5),
            height: 80,
            child: Text(
              ' Popular Hotels ',style: Theme.of(context).textTheme.displayLarge,
            ),
          ),),

        SliverToBoxAdapter(
          child: Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:5,
              itemBuilder: (context, index) {
                return card2Widget(index: index); },
            ),
          ),
        ),

        SliverToBoxAdapter(
          child:Container(
            margin: EdgeInsets.all(5),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  Hotel Packages ',style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  ' View All',style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => card1Widget(index: index),
                childCount:5,
          ))]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}


