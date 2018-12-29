import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cogasoc_hymnal/screens/lesson_list_page.dart';
import 'package:cogasoc_hymnal/screens/song_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? MaterialApp(title: 'Incwadi yaMaculo', home: HomePage())
      : CupertinoApp(title: 'Incwadi yaMaculo', home: HomePage());
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
    return PlatformScaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavBar: PlatformNavBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('Izifundo'),
              icon: PlatformWidget(
                ios: (_) => Icon(CupertinoIcons.book),
                android: (_) => Icon(FontAwesomeIcons.graduationCap),
              )),
          BottomNavigationBarItem(
              title: Text('Amaculo'),
              icon: PlatformWidget(
                ios: (_) => Icon(CupertinoIcons.music_note),
                android: (_) => Icon(FontAwesomeIcons.music),
              )),
        ],
        currentIndex: _selectedIndex,
        itemChanged: _onItemChanged,
        android: (_) => MaterialNavBarData(
          backgroundColor: Colors.lightBlue,
          type: BottomNavigationBarType.fixed,
        ),

      ),
    );
  }

  void _onItemChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
