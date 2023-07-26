import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatelessWidget {
  @override
  var images1=[
    "assets/assignment8/ffz1.jpg",
    "assets/assignment8/ffz3.jpg",
    "assets/assignment8/ffz4.jpg",
      ];
  var images2=[
    "assets/assignment8/offer2.jpg",
    "assets/assignment8/tomato.jpg",
    "assets/assignment8/mandarin.png",
    "assets/assignment8/exotic.jpg",
    "assets/assignment8/freshcuts.jpg",
    "assets/assignment8/nutrition.jpg",
    "assets/assignment8/salad.jpg",
       ];
  var products=[
    "assets/assignment8/cauli.jpg",
    "assets/assignment8/chilli.jpg",
    "assets/assignment8/tomato.jpg",
    "assets/assignment8/mandarin.png",
    "assets/assignment8/exotic.jpg",
    "assets/assignment8/freshcuts.jpg",
    "assets/assignment8/nutrition.jpg",
    "assets/assignment8/salad.jpg",
    "assets/assignment8/avocado.jpg",
    "assets/assignment8/capsicum.jpg",
    "assets/assignment8/carrot.jpg",
    "assets/assignment8/ladiesfinger.jpg",
  ];
  var blog=[
    "assets/assignment8/bp.jpg",
    "assets/assignment8/broccoli.jpg",
    "assets/assignment8/sneez.jpg",
  ];
  var customers=[
    "assets/assignment8/cust1.jpeg",
    "assets/assignment8/cust2.jpg",
    "assets/assignment8/cust3.jpg",
  ];
  var text1=["Offers","Vegetables","Fruits","Exotic","Fresh Cuts","Nutrition Chargers","Salads"];
   Widget build(BuildContext context) {


    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
        title: Text("FARMERS FRESH ZONE", style: GoogleFonts.lato(fontSize: 20,
        color: Colors.white),),
          actions: [
            Text("\nKOCHI", style: GoogleFonts.lato(fontSize: 15,
              color: Colors.white)),
              const Icon(Icons.keyboard_arrow_down_outlined),],



          bottom: AppBar(
            title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(9)
              ),
              width: double.infinity,
              height: 35,
                child:  Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '  Search...',
                    hintStyle: TextStyle(// fontStyle: FontStyle.italic,
                        fontFamily:"GoogleFonts.lato" ,
                        fontSize: 15.0, color: Colors.grey),
                    prefixIcon: Icon(Icons.search,
                      color: Colors.grey
                      ,),
                  ), ),
              ),),
          ),),
        SliverToBoxAdapter(
    child: SizedBox(
    height: 40,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      ElevatedButton(onPressed: (){},
    child: Text("OFFERS",
    style: GoogleFonts.lato(fontSize: 14,
    color: Colors.white ),),

    style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
    ),),
    )),
      ElevatedButton(onPressed: (){},
          child: Text("FRUITS",
            style: GoogleFonts.lato(fontSize: 14,
              color: Colors.white,),),

          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),),
          )),
      ElevatedButton(onPressed: (){},
          child: Text("VEGETABLES",
            style: GoogleFonts.lato(fontSize: 14,
              color: Colors.white,),),

          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),),
          )),
      ElevatedButton(onPressed: (){},
          child: Text("EXOTICS",
            style: GoogleFonts.lato(fontSize: 14,
              color: Colors.white,),),

          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),),
          )),

    ]
    ),
    ),
    ),
        SliverToBoxAdapter(
            child:
              CarouselSlider(
                items:List.generate(3,(index) => Card(
                child: Image.asset(images1[index]),
              )),
                options:  CarouselOptions(
                  height: 220,
                  aspectRatio: 8 / 16,
                  viewportFraction: 1,
                  initialPage: 2,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  enlargeCenterPage: true,
                  enlargeFactor: .5,
                  scrollDirection: Axis.horizontal
              ),
              )),

        SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    style: BorderStyle.solid,
                    width: .8,
                  ),
                ),
                height: 90,

    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      InkWell( onTap: (){},
        child: Container(
          child: Column(
            children: [
              Image.asset( "assets/assignment8/timer.png",height: 45,width: 45),
              Text("30 MINS POLICY")

            ],
          ),
        ),
      ),
      InkWell(onTap: (){},
        child: Container(
          child: Column(
            children: [
              Image.asset( "assets/assignment8/phone.png",height: 45,width: 45),
              Text("TRACAEBILITY")

            ],
          ),
        ),
      ),
      InkWell(onTap: (){},
        child: Container(
          child: Column(
            children: [
              Image.asset( "assets/assignment8/farmer.png",height: 45,width: 45),
              Text("LOCAL SOURCING")

            ],
          ),
        ),
      ),

    ],

          ),),),

        SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 1.0,
    ),
         delegate: SliverChildBuilderDelegate(
    (context, index) {
    return
    Card(

      child: Column(
        children:[
          ClipRRect(
            child: Align(

              alignment: Alignment.topCenter,
              heightFactor: .8,
              child:Image.asset(images2[index]),
            ),
          ),

          Text(text1[index],style: GoogleFonts.lato(fontSize: 15,)),
        ], ),
      elevation: 5.0,
         );
    }, childCount: images2.length,

    ),)

          ,
        SliverToBoxAdapter(
         child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/assignment8/banner1.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    height: 150,
      )),


        SliverToBoxAdapter(
              child:Container(
                height: 90,
                child:Text("\nBest Selling Products",style: GoogleFonts.lato(fontSize: 30,color: Colors.green[900],),)
              )),

        SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 1.0,
    ),
         delegate: SliverChildBuilderDelegate(
    (context, index) {
    return
      Expanded(
        child: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: .6,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(products[index]),
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
            ),

        Text("Name:",style: GoogleFonts.lato(fontSize: 15,fontStyle: FontStyle.italic,)),
        Text("price:",style: GoogleFonts.lato(fontSize: 15,fontStyle: FontStyle.italic,)),
     Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Unit:",style: GoogleFonts.lato(fontSize:15,fontStyle: FontStyle.italic,)),
    ElevatedButton(
          onPressed: () {
    },
    child: Text("Add",    style: GoogleFonts.lato(fontSize: 15,
    color: Colors.white,
    fontStyle: FontStyle.italic,),),
    style: ButtonStyle(
    shape: MaterialStateProperty.all<
    RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
    )),], ),  ],
        ),
    ),
      );
    }, childCount: products.length,
    ),  ),

        SliverToBoxAdapter(
         child:
         ElevatedButton(
    onPressed: () {
    },
    child: Text("View More",
    style: GoogleFonts.lato(fontSize: 20,
    color: Colors.white,
    fontStyle: FontStyle.italic,),),
    style: ButtonStyle(
    shape: MaterialStateProperty.all<
    RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
    )),),


        SliverToBoxAdapter(
         child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/assignment8/banner2.jpg"),
    fit: BoxFit.cover,
    ),
    ),
    height: 150,
    )),

        SliverToBoxAdapter(
              child:Container(
                  height: 90,
                  child:Text("Our Blog Posts",style: GoogleFonts.lato(fontSize: 30,color: Colors.green[900],),)
              )),

        SliverToBoxAdapter(
            child: Container(

              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: .6,
                      ),
                    ),
                    width: 190.0,
                    height: 400,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(blog[index]),
                             fit: BoxFit.cover,
                            ),
                          ),
                          height: 75,
                          width: 180,
                        ),
                        Text("Blood Pressure"),
                      ],
                    ),
                  );
                },
              ),),),

        SliverToBoxAdapter(
            child:
            ElevatedButton(
                onPressed: () {
                },
                child: Text("View More",
                  style: GoogleFonts.lato(fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,),),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
                )),),

          SliverToBoxAdapter(
              child:Container(
                  height: 90,
                  child:Text("\nWhat our customers says..",style: GoogleFonts.lato(fontSize: 30,color: Colors.green[900],),)
              )),
          SliverToBoxAdapter(
              child:
              CarouselSlider(items:List.generate(3,(index) => Card(
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,2,200,2),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(customers[index])),
                          Text("CustomerName")   ],
                      ),
                    ),
    Text("Contrary to popular belief, \nLorem Ipsum is not simply random text. It has ro\n"
        "ots in a piece of classical Latin\n literature from 45 BC, making \n"
        "it over 2000 years old. Richard McClintock,\n a Latin professor at"
        " Hampden-Sydney College")  ],)),),
              options:  CarouselOptions(
                  height: 220,
                  aspectRatio: 8 / 16,
                  viewportFraction: 1,
                  initialPage: 2,
                  enableInfiniteScroll: true,
                //  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  enlargeCenterPage: true,
                  enlargeFactor: .5,
                  scrollDirection: Axis.horizontal
              ), )  ),

          SliverToBoxAdapter(
              child:Container(
                  height: 90,
                  child:Center(child: Text("\nThis is kochi-based-farm-to-fork online\nmarketplace is connecting farmers\n            directly to customers",style: GoogleFonts.lato(fontSize: 15,color: Colors.green[900],),))
              )),

          SliverToBoxAdapter(
              child:Container(
                  height: 90,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Image.asset("assets/assignment8/news_1.png",height: 45,width: 45),
                      Image.asset("assets/assignment8/news_2.png",height: 45,width: 45),
                      Image.asset("assets/assignment8/news_3.png",height: 45,width: 45),
                      Image.asset("assets/assignment8/news_4.png",height: 45,width: 45),
                    ],
                  ))),
    ],
    ),
    );
  }
}












































