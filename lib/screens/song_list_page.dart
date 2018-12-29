import 'package:cogasoc_hymnal/database/database_helper.dart';
import 'package:cogasoc_hymnal/database/model.dart';
import 'package:cogasoc_hymnal/screens/song_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    return PlatformScaffold(
        appBar: PlatformAppBar(
            title: Text('Amaculo', style: TextStyle(color: Colors.white),),
            ios: (_) =>
                CupertinoNavigationBarData(transitionBetweenRoutes: false, backgroundColor: Colors.blue)),
        body: SafeArea(
            child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Material(
              child: Column(children: [
                ListTile(
                  title: Text("${items[index].id}. ${items[index].title}"),
                  onTap: () => isMaterial
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SongDetailPage(
                                  items: items, song: items[index])))
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SongDetailPage(
                                  items: items, song: items[index]))),
                ),
                Divider(
                  height: 2.0,
                )
              ]),
            );
          },
        )));
  }
}
