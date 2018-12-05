import 'package:cogasoc_hymnal/database/model.dart';
import 'package:flutter/material.dart';

class SongDetailPage extends StatefulWidget {

  final Song song;
  const SongDetailPage({Key key, this.song}) : super(key: key);

  @override
  SongDetailPageState createState() => new SongDetailPageState();
}

class SongDetailPageState extends State<SongDetailPage> {

  @override
  Widget build(BuildContext context) {

    final _titleFont = const TextStyle(fontSize: 18.0, fontFamily: "Robot");
    final _bodyFont = const TextStyle(fontSize: 16.0, fontFamily: "America Typewriter");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: Text("${widget.song.title}", style: _titleFont,),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${widget.song.words}", style: _bodyFont),
        ),
        ),
      ),
    );
  }
}