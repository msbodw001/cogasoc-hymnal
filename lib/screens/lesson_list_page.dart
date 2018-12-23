import 'package:cogasoc_hymnal/database/database_helper.dart';
import 'package:cogasoc_hymnal/database/model.dart';
import 'package:cogasoc_hymnal/screens/lesson_detail_page.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
        appBar: AppBar(title: Text('Amaculo')),
        body: SafeArea(child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index){
            return Column(
                children: [
                  ListTile(
                    title: Text("${items[index].id}. ${items[index].title}"),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LessonDetailPage(items: items, lesson: items[index]))),
                  ),
                  Divider(height: 2.0,)
                ]);
          },
        )));
  }
}
