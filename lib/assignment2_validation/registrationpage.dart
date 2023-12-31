import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'homepage.dart';

class Registrationpage extends StatefulWidget {
  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  //to validate the entire form
  final formkey = GlobalKey<FormState>();
  var confirmpass; // to store value from password field
  bool showpwd = true;
  bool showpwd2 = true;
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  final mycontroller3 = TextEditingController();
  final mycontroller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                "Sign Up",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "create an account, its free",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(controller: mycontroller1,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(40),),
                      hintText: "Name"),
                  validator: (name) {
                    // email - data from text form field
                    if (name!.isEmpty ) {
                      return " field must not be empty";
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(40),),
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
                child: TextFormField(controller: mycontroller3, style: GoogleFonts.lato(fontSize: 20,
                    color: Colors.black,  fontStyle: FontStyle.italic ),
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
                      border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(40),),
                      hintText: "Password"),
                  textInputAction: TextInputAction.next,
                  validator: (password) {
                    //password - data from text form field
                    // password cannot accessed outside this validator function so the value from
                    // password field assigned to  the instant variable confirmpass
                    confirmpass = password;
                    if (password!.isEmpty || password.length < 6) {
                      return "Password length should be greater than 6 / must not be empty ";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(controller: mycontroller4,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: showpwd2,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (showpwd2) {
                                showpwd2 = false;
                              } else {
                                showpwd2 = true;
                              }
                            });
                          },
                          icon: Icon(showpwd2 == true
                              ? Icons.visibility
                              : Icons.visibility_off_sharp)),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),),
                      hintText: "ConfirmPassword"),
                  validator: (cpassword) {
                    if (cpassword != confirmpass || cpassword!.isEmpty) {
                      return "Password Mismatch/ empty";
                    } else {
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
                          MaterialPageRoute(builder: (context) => HomePage()));
                      mycontroller1.clear();
                      mycontroller2.clear();
                      mycontroller3.clear();
                      mycontroller4.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,
                          content: Text("Registration Failed")));
                    }
                  },
                  child: Text(
                    "Sign up",
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
                      TextSpan(text: "SignIn",
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
