import 'package:cogasoc_hymnal/database/database_helper.dart';
import 'package:cogasoc_hymnal/database/model.dart';
import 'package:cogasoc_hymnal/screens/song_detail_page.dart';
import 'package:flutter/material.dart';

class SongIndexPage extends StatefulWidget {

  @override
  _SongIndexPageState createState() => new _SongIndexPageState();
}

class _SongIndexPageState extends State<SongIndexPage> {

  List<Song> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllSongs().then((songs) => setState(() {
        songs.forEach((song) {
          items.add(Song.fromMap(song));
        });
      }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Amaculo')),
        body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index){
            return Column(
                children: [
                  ListTile(
                    title: Text("${items[index].id}. ${items[index].title}"),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetailPage(items: items, song: items[index]))),
                  ),
                  Divider(height: 2.0,)
                ]);
          },
        ));
  }
}




