import 'package:flutter/material.dart';
import 'ramada.dart';
import 'crown.dart';
import 'meridian.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
        textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 16, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 18, color: Colors.purple),
      headlineSmall: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    )),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tapindex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          currentIndex: tapindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings')
          ],
          onTap: (value) {
            setState(() {
              tapindex = value;
            });
          }),
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
}
