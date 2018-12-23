import 'package:cogasoc_hymnal/database/model.dart';
import 'package:flutter/material.dart';

class LessonDetailPage extends StatefulWidget {

  final Lesson lesson;
  final List<Lesson> items;
  const LessonDetailPage({Key key, this.lesson, this.items}) : super(key: key);

  @override
  LessonDetailPageState createState() => new LessonDetailPageState();
}

class LessonDetailPageState extends State<LessonDetailPage> {

  @override
  Widget build(BuildContext context) {

    final _titleFont = const TextStyle(fontSize: 18.0, fontFamily: "Roboto, ");
    final _bodyFont = const TextStyle(fontSize: 16.0, fontFamily: 'Verdana, sans-serif');
    final _controller = PageController(initialPage: widget.lesson.id - 1);
    final _leading = new IconButton(icon: new Icon(Icons.home), onPressed: () => Navigator.pop(context));
    List<Widget> _pages= new List<Widget>.generate(widget.items.length, (lesson) => Scaffold(appBar: AppBar(leading: _leading, title: Text("${widget.items[lesson].title}", style: _titleFont,)), body: SafeArea(child: Container(child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(8.0),child: Text("${widget.items[lesson].words}", style: _bodyFont),)),))));
    final pageView = PageView(controller: _controller, children: _pages,);
    return pageView;
  }
}
