import 'package:cogasoc_hymnal/database/database_helper.dart';
import 'package:cogasoc_hymnal/database/model.dart';
import 'package:cogasoc_hymnal/screens/lesson_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LessonIndexPage extends StatefulWidget {
  @override
  _LessonIndexPageState createState() => new _LessonIndexPageState();
}

class _LessonIndexPageState extends State<LessonIndexPage> {
  List<Lesson> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllLessons().then((lessons) => setState(() {
          lessons.forEach((lesson) {
            items.add(Lesson.fromMap(lesson));
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
            title: Text('Izifundo', style: TextStyle(color: Colors.white),),
            ios: (_) =>
                CupertinoNavigationBarData(backgroundColor: Colors.blue, transitionBetweenRoutes: false)),
        body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Material(
              child: Column(children: [
                ListTile(
                  title: new Text("${items[index].id}. ${items[index].title}"),
                  onTap: () => isMaterial
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LessonDetailPage(
                                  items: items, lesson: items[index])))
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LessonDetailPage(
                                  items: items, lesson: items[index]))),
                ),
                Divider(
                  height: 2.0,
                )
              ]),
            );
          },
        ));
  }
}
