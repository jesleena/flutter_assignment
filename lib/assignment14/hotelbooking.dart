import 'package:flutter/material.dart';

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
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Card(

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

                ],), ); },
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
                (context, index) => Card(
                  margin: EdgeInsets.all(3),
                  child: Row
                    (children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft:Radius.circular(10.0) ),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ), ),

                    Container(
                        width: 135,
                        height: 100,
                        child: Column(children: [
                          Align(
                              alignment:Alignment.topLeft,
                              child: Text(names[index],style:Theme.of(context).textTheme.displayMedium)),
                          Align(
                              alignment:Alignment.topLeft,
                              child: Text("A Five star hotel",style:Theme.of(context).textTheme.bodyMedium)),
                        Align(
                            alignment:Alignment.topLeft,
                          child:
                          Text("\$180/night",style:Theme.of(context).textTheme.bodySmall),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.car_rental,color: Colors.blue,),
                            Icon(Icons.bed_sharp,color: Colors.blue),
                            Icon(Icons.no_drinks_outlined,color: Colors.blue,),
                            Icon(Icons.wifi,color: Colors.blue,),

                          ],
                        )
                        ])),
                    ElevatedButton(onPressed: (){}, child:Text("book now"))

                  ],), ),

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


