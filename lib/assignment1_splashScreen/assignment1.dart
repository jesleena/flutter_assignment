import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
    assgn1(),
  ));}

class assgn1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,image:AssetImage("assets/assignment1/bag3.jpg"),),),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/assignment1/logo2.png',  height: 200, width: 200, ),
              Text( "Eat healthy Stay healthy", style: GoogleFonts.pacifico(fontSize: 30,color: Colors.black), ),
            ],
          ),
        ),
      ),
    );
  }
}