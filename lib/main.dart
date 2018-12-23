import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cogasoc_hymnal/screens/lesson_list_page.dart';
import 'package:cogasoc_hymnal/screens/song_list_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  MyAppState createState() => new MyAppState();

}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) => MaterialApp(title: 'Incwadi yaMaculo', home: HomePage());

}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    LessonIndexPage(),
    SongIndexPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.graduationCap), title: Text('Izifundo')),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.music), title: Text('Amaculo')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

