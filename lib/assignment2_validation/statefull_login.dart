import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'homepage.dart';

class StatefullLogin extends StatefulWidget {
  @override
  State<StatefullLogin> createState() => _StatefullLoginState();
}

class _StatefullLoginState extends State<StatefullLogin> {
  //to validate the entire form
  final formkey = GlobalKey<FormState>();
  var confirmpass; // to store value from password field
  bool showpwd = true;
  bool showpwd2 = true;
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  String username="jes@12345";
  String passwd="9876543210";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("SignUp...",
        // style: GoogleFonts.lato(fontSize: 20,color: Colors.brown,fontStyle: FontStyle.italic,),),
        backgroundColor: Colors.white,
        elevation: 0,),

      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/assignment2/icon1.png',
                height: 100,
                width: 100,
              ),
              Text(
                "Sign In",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "Welcome back,login with your credentials",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: mycontroller1,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),

                  decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: "UserName"),
                  validator: (email) {
                    // email - data from text form field
                    if (email!.isEmpty || !email.contains('@')) {
                      return "Enter a valid email/ field must not be empty";

                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(controller: mycontroller2,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  obscureText: showpwd,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (showpwd) {
                                showpwd = false;
                              } else {
                                showpwd = true;
                              }
                            });
                          },
                          icon: Icon(showpwd == true
                              ? Icons.visibility
                              : Icons.visibility_off_sharp)),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),),
                      hintText: "Password"),
                  textInputAction: TextInputAction.next,
                  validator: (password) {
                    //password - data from text form field
                    // password cannot accessed outside this validator function so the value from
                    // password field assigned to  the instant variable confirmpass

                    if (password!.isEmpty || password.length < 6 ) {
                      return "Password length should be greater than 6 / must not be empty ";
                    }
                    // else if(password!= passwd){
                    //   ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:Text("username or password incorrect"),backgroundColor: Colors.red,));
                    // }
                      else {
                      return null;
                    }
                  },
                ),
              ),


              ElevatedButton(
                  onPressed: () {
                    var isValid = formkey.currentState!.validate();
                    if (isValid == true) {

                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        mycontroller1.clear();
                        mycontroller2.clear();

                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:Colors.red,content:Text( "invalid email/password")));
                    }
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white60,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.brown),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child:RichText(text:TextSpan(
                    style: GoogleFonts.lato(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,),
                    children: [
                      TextSpan(text: "Already have an account?",),
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
