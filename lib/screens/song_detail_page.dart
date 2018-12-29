import 'package:cogasoc_hymnal/database/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SongDetailPage extends StatefulWidget {
  final Song song;
  final List<Song> items;
  const SongDetailPage({Key key, this.song, this.items}) : super(key: key);

  @override
  SongDetailPageState createState() => new SongDetailPageState();
}

class SongDetailPageState extends State<SongDetailPage> {
  @override
  Widget build(BuildContext context) {
    final _titleFont = const TextStyle(
        color: Colors.white, fontSize: 18.0, fontFamily: "Roboto, ");
    final _bodyFont =
        const TextStyle(fontSize: 16.0, fontFamily: 'Verdana, sans-serif');
    final _controller = new PageController(initialPage: widget.song.id - 1);
    List<Widget> _pages = new List<Widget>.generate(
        widget.items.length,
        (song) => new PlatformScaffold(
            appBar: new PlatformAppBar(
                ios: (_) =>
                    CupertinoNavigationBarData(backgroundColor: Colors.blue),
                leading: new PlatformIconButton(
                    iosIcon: new Icon(CupertinoIcons.home, color: Colors.white,),
                    androidIcon: new Icon(Icons.home),
                    onPressed: () => Navigator.pop(context)),
                title: new Text(
                  "${widget.items[song].title}",
                  style: _titleFont,
                )),
            body: new SafeArea(
                child: new Container(
              child: new SingleChildScrollView(
                  child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    new Text("${widget.items[song].words}", style: _bodyFont),
              )),
            ))));
    final pageView = new PageView(
      controller: _controller,
      children: _pages,
    );
    return pageView;
  }
}
