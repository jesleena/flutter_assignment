import 'package:flutter/material.dart';
import 'placeDetails.dart';
import 'dataTourism.dart';

void main() {
  runApp(MaterialApp(
    theme:  ThemeData().copyWith(
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize:40, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.white,fontStyle: FontStyle.italic),
          displayMedium: TextStyle(fontSize:35, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.deepPurple),
          displaySmall: TextStyle(fontSize:35, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.white),
          headlineMedium: TextStyle(fontSize:35, fontFamily:'Amaranth',color:Colors.black),
         headlineSmall: TextStyle(fontSize:18, fontFamily:'Amaranth',color:Colors.black),
        )
    ),
    home: PlaceList(),
    debugShowCheckedModeBanner: false,
       routes: {
      "details": (context) => PlaceDetails(),

    },
  ));
}

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9)
            ),
            width: 700,
            height: 60,
            child:Text("TOURISM",style: Theme.of(context).textTheme.displayLarge,)),
      ),
    body:
      ListView(
        children:[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9)
              ),
              width: 700,
              height: 60,
              child:Text("  Popular",style: Theme.of(context).textTheme.displayMedium,)),
          Column(
         // padding: EdgeInsets.all(8),
          children: places.map((e) => GestureDetector(
            child: Card(
              child: Stack(
                children: <Widget>[
              Container(
             // width: 440,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(e["image1"]),
                  fit: BoxFit.cover,
                ),
              ), ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 190, 20, 0),
                    child:
                    Text(e["name"],style: Theme.of(context).textTheme.displaySmall),),
                ],
              ),
            ), onTap: ()=> goToDetails(context,e['id']),
          ),).toList(),
        ),]
      ),
    );
  }

  void goToDetails(BuildContext context, id) {   // id = e['id'] - id of item that we tapped
    Navigator.pushNamed(context, "details", arguments: id);
  }
}
