import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: Productlist(),
  ));
}
class Productlist extends StatelessWidget {
 @override
  var names=["Tomato","Capsicum","Carrot","Cauliflower","Chilli","Tomato","Capsicum","Carrot","Cauliflower","Chilli","Tomato","Capsicum","Carrot","Cauliflower","Chilli"];
  var unit=["kg","pc","kg","pc","gm","kg","pc","kg","pc","gm","kg","pc","kg","pc","gm"];
  var images=[
    "assets/assignment6/tomato.jpg",
    "assets/assignment6/capsicum.jpg",
    "assets/assignment6/carrot.jpg",
    "assets/assignment6/cauli.jpg",
    "assets/assignment6/chilli.jpg",
    "assets/assignment6/tomato.jpg",
    "assets/assignment6/capsicum.jpg",
    "assets/assignment6/carrot.jpg",
    "assets/assignment6/cauli.jpg",
    "assets/assignment6/chilli.jpg",
    "assets/assignment6/tomato.jpg",
    "assets/assignment6/capsicum.jpg",
    "assets/assignment6/carrot.jpg",
    "assets/assignment6/cauli.jpg",
    "assets/assignment6/chilli.jpg"];
  var price=["100/-","90/-","40/-","52/-","80/-","100/-","90/-","40/-","52/-","80/-","100/-","90/-","40/-","52/-","80/-"];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ), ),
          actions: const [
            Icon(Icons.shopping_cart)],
        ),
        body: ListView(children:List.generate(15,(index) =>
            Card(
              color: Colors.grey[400],
              elevation: 5,
              child: ListTile(
                  leading: CircleAvatar(   backgroundImage: AssetImage(images[index])),
                  title: Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Name:",style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.italic,)),
                          Text(names[index],style: GoogleFonts.lato(fontSize: 25,fontStyle: FontStyle.italic,)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Unit:",style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.italic,)),
                          Text(unit[index],style: GoogleFonts.lato(fontSize: 22,fontStyle: FontStyle.italic,)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("price:",style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.italic,)),
                          Text(price[index],style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.italic,)),
                        ], ),  ],
                  ),
                  trailing: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(onPressed: () {
                    },
                        child: Text("Add to cart",
                          style: GoogleFonts.lato(fontSize: 15,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,),),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),),
                        )),
                  )
              ),
            )))
    );
  }
}