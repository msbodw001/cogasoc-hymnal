// model code


class Song {
  int _id;
  String _title;
  String _words;

  Song(this._title, this._words);

  Song.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._words = obj['words'];
  }

  int get id => _id;
  String get title => _title;
  String get words => _words;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['words'] = _words;

    return map;
  }

  Song.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._words = map['words'];
  }
}


class Lesson {
  int _id;
  String _title;
  String _words;

  Lesson(this._title, this._words);

  Lesson.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._words = obj['words'];
  }

  int get id => _id;
  String get title => _title;
  String get words => _words;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['words'] = _words;

    return map;
  }

  Lesson.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._words = map['words'];
  }
}