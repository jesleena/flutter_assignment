import 'package:flutter/material.dart';
import 'dataTourism.dart';

class PlaceDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final place = places.firstWhere((mapfromlist) => mapfromlist["id"] == id);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            // width: 440,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(place["image2"],),
                fit: BoxFit.cover,
              ),
            ), ),

            Text(place["name"],
                style: Theme.of(context).textTheme.displaySmall),

            Text(place["description"],style: Theme.of(context).textTheme.headlineSmall),


            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(3),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(place["place${index}"]),
                        fit: BoxFit.cover,
                      ),
                    ), ); },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                },
                child: Text("            Explore         ",
                    style: Theme.of(context).textTheme.displayMedium),
                style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
                )),
          ],
        ));
  }
}