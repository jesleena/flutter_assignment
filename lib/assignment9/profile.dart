import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.grey),
    home: MyProfile(),
  ));
}

class MyProfile extends StatelessWidget {
  var names = ["Privacy", "Purchace History", "Help & Support", "Settings", "Invite a Friend","LogOut",];
  static const gridicon = <IconData>[
    Icons.privacy_tip,
    Icons.timer,
    Icons.help,
    Icons.settings,
    Icons.person_add_outlined,
    Icons.logout,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black),
        actions: [Icon(
            Icons.more_horiz_outlined,
            color: Colors.black),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage("assets/assignment9/dp.jpg",)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 50,width:50,
                    child: Image.asset("assets/assignment9/fb.png",fit: BoxFit.fill)),
                Container(height: 70,width:70,
                    child: Image.asset("assets/assignment9/twitter.png",fit: BoxFit.fill)),
                Container(height: 50,width:50,
                    child: Image.asset("assets/assignment9/linkedin.jpg",fit: BoxFit.fill)),
                Container(height: 70,width:70,
                    child: Image.asset("assets/assignment9/GitHub.png",fit: BoxFit.fill)),
              ],
            ),
            Text("Neha",style: GoogleFonts.lato(fontSize: 35,fontStyle: FontStyle.italic,)),
            Text("@devops",style: GoogleFonts.lato(fontSize: 18,fontStyle: FontStyle.italic,)),
            Text("Mobile App Developer",style: GoogleFonts.lato(fontSize: 25)),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: ListView.builder(
                          //primary: false,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: names.length ,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.grey[350],
                                child:
                              ListTile(
                                leading: Icon(gridicon[index]),
                                title: Text(names[index], style: GoogleFonts.lato(
                                    fontSize: 20)),
                                trailing: Icon(Icons.navigate_next),
                              ),);
                            }
                        ),
                      ),
                    ],
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}



