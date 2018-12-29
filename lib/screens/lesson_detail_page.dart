import 'package:cogasoc_hymnal/database/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    final _titleFont = const TextStyle(
        color: Colors.white, fontSize: 18.0, fontFamily: "Roboto, ");
    final _bodyFont =
        const TextStyle(fontSize: 16.0, fontFamily: 'Verdana, sans-serif');
    final _controller = new PageController(initialPage: widget.lesson.id - 1);
    List<Widget> _pages = new List<Widget>.generate(
        widget.items.length,
        (lesson) => PlatformScaffold(
            appBar: new PlatformAppBar(
                ios: (_) =>
                    CupertinoNavigationBarData(backgroundColor: Colors.blue),
                leading: new PlatformIconButton(
                  onPressed: () => Navigator.pop(context),
                  iosIcon: new Icon(CupertinoIcons.home, color: Colors.white,),
                  androidIcon: new Icon(Icons.home),
                ),
                title: new Text(
                  "${widget.items[lesson].title}",
                  style: _titleFont,
                )),
            body: new Container(
              child: new SingleChildScrollView(
                  child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    new Text("${widget.items[lesson].words}", style: _bodyFont),
              )),
            )));
    final pageView = new PageView(
      controller: _controller,
      children: _pages,
    );
    return pageView;
  }
}
