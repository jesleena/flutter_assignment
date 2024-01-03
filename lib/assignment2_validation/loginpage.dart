import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrationpage.dart';
import 'homepage.dart';


class LoginPage extends StatelessWidget {
  String username="jes@12345";
  String password="9876543210";
  final uname = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //title: Text("login...",
         // style: GoogleFonts.lato(fontSize: 20,color: Colors.brown,fontStyle: FontStyle.italic,),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/assignment2/icon1.png',  height: 100, width: 100, ),
              Text( "login", style: GoogleFonts.lato(fontSize: 50,color: Colors.brown,fontStyle: FontStyle.italic,), ),
              Text( "Welcome back,login with your credentials", style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,), ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: uname,
                  style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  decoration:  InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),),
                      hintText: "username",
                      helperText: "username should be email",
                      labelText: "username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField( style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: passwd,
                  decoration:  InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                      hintText: "password",
                      helperText: "password must contain 6 characters",
                      labelText: "password",
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

             // MaterialButton(onPressed: (){},color: Colors.brown,),
              ElevatedButton(onPressed:() {
                if(uname.text!="" && passwd.text!="") {
                  if (uname.text == username && passwd.text == password) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password incorrect"),backgroundColor: Colors.red,));
                  }
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password must not be empty"),backgroundColor: Colors.red,));
                }
                uname.text="";
                passwd.text="";
              },

                child:  Text("login",style: GoogleFonts.lato(fontSize: 20,color: Colors.white60,fontStyle: FontStyle.italic,),),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
                ) ,),

              TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Registrationpage()));},
                child: RichText(text:TextSpan(
                    style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                    children: [
                  TextSpan(text: "Don't you have an account?",),
                  TextSpan(text: "SignUp",
                      style:TextStyle( fontWeight: FontWeight.bold),),
                ]
              )  , ),)

            ],
          ),
        ),
      ),
    );
  }
}