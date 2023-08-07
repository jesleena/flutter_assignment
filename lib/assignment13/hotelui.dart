import 'package:flutter/material.dart';
import 'ramada.dart';
import 'crown.dart';
import 'meridian.dart';


void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(primarySwatch: Colors.deepPurple).copyWith(
            textTheme: TextTheme(
              displayLarge: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:Colors.white,),
              displayMedium: TextStyle(fontSize:20,color:Colors.black,fontWeight: FontWeight.bold),
              displaySmall: TextStyle(fontSize:16,color:Colors.black),
              headlineMedium: TextStyle(fontSize:18, color:Colors.purple),
              headlineSmall: TextStyle(fontSize:18, color:Colors.white,fontWeight: FontWeight.bold),
            )
        ),
        home: HomePage(),
      ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();


    @override
    Widget build(BuildContext context) {
      return  Scaffold(extendBodyBehindAppBar: true,

      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings')
        ],
        onTap: _onTappedBar,
        selectedItemColor: Colors.purple,
        currentIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
      ramada(),
      lemeridian(),
      crown(),
        ],
      ),
    );

  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
   // _pageController.jumpToPage(value);
  }
}







/*

void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(primarySwatch: Colors.deepPurple).copyWith(
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize:40, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.white,fontStyle: FontStyle.italic),
            displayMedium: TextStyle(fontSize:35, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.deepPurple),
            displaySmall: TextStyle(fontSize:18, fontFamily:'Amaranth',fontWeight: FontWeight.bold,color:Colors.black),
            headlineMedium: TextStyle(fontSize:25, fontFamily:'Amaranth',color:Colors.purple),
            headlineSmall: TextStyle(fontSize:18, fontFamily:'Amaranth',color:Colors.white,fontWeight: FontWeight.bold),
          )
      ),
      home: Scaffold(extendBodyBehindAppBar: true,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: PageViewExample(),
      ),
    );
  }
}

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: <Widget>[

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
                    padding: const EdgeInsets.fromLTRB(30, 190, 20, 0),
                    child:
                    Text("RAMADA",style: Theme.of(context).textTheme.displaySmall),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 300, 20, 0),
                    child:
                    Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),color: Colors.grey,),
                        child: Text("  9/10 Reviews  ",style: Theme.of(context).textTheme.headlineSmall)),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(300, 300, 20, 0),
                    child:
                    Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: AssetImage('assets/assignment13/heart.png'),
                          fit: BoxFit.cover,
                        ),
                      ), ),),



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
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
              print(rating);
              },
              ),
                  Text(" Rs 12000/ ",style: Theme.of(context).textTheme.headlineMedium)
                ],
              ),
              ElevatedButton(onPressed: (){},
                  child: Container(
                    height: 40,
                    width: 300,
                    child: Center(
                      child: Text("Book Now",
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), ),),
                  )),
              Text("Relax in Kochi\n    Close to Cochin International Airport and Kochi city center\n  Choose our Ramada Resort Kochi hotel near Kochi City Center for numerous amenities and comfortable accommodations in a convenient location. Our Cochin location is 45 minutes from Cochin International Airport (COK), and our comfortable, convenient amenities make our hotel the perfect choice for business and leisure travelers alike.",
                  style: Theme.of(context).textTheme.displaySmall),
            ],
          ),

        Column(
          children: [
            Stack(
              children: [
                Container(

                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage('assets/assignment13/meridian.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ), ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 190, 20, 0),
                  child:
                  Text("LE MERIDIAN",style: Theme.of(context).textTheme.displaySmall),),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(

                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage('assets/assignment13/crown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ), ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 190, 20, 0),
                  child:
                  Text("CROWN PLAZA",style: Theme.of(context).textTheme.displaySmall),),
              ],
            ),
          ],
        ),
      ],
    );

  }
}*/
