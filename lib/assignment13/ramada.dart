import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class lemeridian extends StatefulWidget {
  const lemeridian({Key? key}) : super(key: key);

  @override
  State<lemeridian> createState() => _lemeridianState();
}

class _lemeridianState extends State<lemeridian> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:
      Column(
        children: [
          Stack(
            children: [
              Container(

                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage('assets/assignment13/ramada.jpg'),
                    fit: BoxFit.cover,
                  ),
                ), ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 250, 20, 0),
                child:
                Text("Ramada Resorts,Kochi",style: Theme.of(context).textTheme.displayLarge),),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 300, 20, 0),
                child:
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),color: Colors.grey,),
                    child: Text("  9/10 Reviews  ",style: Theme.of(context).textTheme.headlineSmall)),),
              Padding(
                  padding: const EdgeInsets.fromLTRB(300, 300, 20, 0),
                  child:Icon(Icons.favorite_border_outlined,color: Colors.white,)
              ),



            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
           itemPadding: EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context,index) => Icon(
                  Icons.star,
                  color: Colors.purple,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text("\$ 200/  ",style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
          ElevatedButton(onPressed: (){},
              child: Container(
                height: 40,
                width: 300,
                child: Center(
                  child: Text("Book Now",
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 110, 0),
            child: Text("Ramada Palm Grove,Kochi" , style: Theme.of(context).textTheme.displayMedium),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Relax in Kochi\n    Close to Cochin International Airport and Kochi city center\n  Choose our Ramada Resort Kochi hotel near Kochi City Center for numerous amenities and comfortable accommodations in a convenient location. Our Cochin location is 45 minutes from Cochin International Airport (COK), and our comfortable, convenient amenities make our hotel the perfect choice for business and leisure travelers alike.",
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ],
      ),
    );
  }
}



