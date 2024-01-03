import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listview_custom(),));
}
class Listview_custom extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("custome"),),
      body:


          ListView.custom(childrenDelegate: SliverChildListDelegate(
        List.generate(5, (index) => Card(
          color: Colors.purpleAccent,
          child:Expanded(
            child: Row(
              children: [

               Image.asset("assets/assignment6/tomato.jpg",width: 300,),

                 Column(children: [
                    Text("Name"),
                    Text("Quantity"),
                    Text("Price"),
                  ],),
               
              ],
            ),
          )
        ))
      )),
    );
  }
}
