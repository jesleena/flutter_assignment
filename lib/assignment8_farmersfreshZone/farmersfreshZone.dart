import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),

    home: SplashPage(),

  ));
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState(); //create and initial state for the screen
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => HomePage()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/assignment8/logoffz.png'),
              Text( "FARMERS FRESH ZONE",
                style: GoogleFonts.lato(fontSize: 30,color: Colors.green[900],), ),
            ],
          ),
        ),
      ),
    );
  }
}

