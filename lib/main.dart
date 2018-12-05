import 'package:cogasoc_hymnal/screens/song_list_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget{

  @override
  MyAppState createState() => new MyAppState();

}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) => MaterialApp(title: 'Incwadi yaMaculo', home: SongIndexPage());

}

