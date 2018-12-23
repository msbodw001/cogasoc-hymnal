import 'package:cogasoc_hymnal/database/model.dart';
import 'package:flutter/material.dart';


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

    final _titleFont = const TextStyle(fontSize: 18.0, fontFamily: "Roboto, ");
    final _bodyFont = const TextStyle(fontSize: 16.0, fontFamily: 'Verdana, sans-serif');
    final _controller = PageController(initialPage: widget.song.id - 1);
    final _leading = new IconButton(icon: new Icon(Icons.home), onPressed: () => Navigator.pop(context));
    List<Widget> _pages= new List<Widget>.generate(widget.items.length, (song) => Scaffold(appBar: AppBar(leading: _leading, title: Text("${widget.items[song].title}", style: _titleFont,)), body: SafeArea(child: Container(child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(8.0),child: Text("${widget.items[song].words}", style: _bodyFont),)),))));
    final pageView = PageView(controller: _controller, children: _pages,);
    return pageView;
    }
}
