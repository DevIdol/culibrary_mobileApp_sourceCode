import 'package:floor/floor.dart';

@entity
class Mon {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'montable')
  final String? startTime;
  final String? endTime;
  final String? subject;
  final String? note;
  Mon(this.startTime, this.endTime, this.subject, this.note, {this.id});
}

@entity
class Tue {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'tuetable')
  final String? startTime;
  final String? endTime;
  final String? subject;
  final String? note;
  Tue(this.startTime, this.endTime, this.subject, this.note, {this.id});
}

@entity
class Wed {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'wedtable')
  final String? startTime;
  final String? endTime;
  final String? subject;
  final String? note;
  Wed(this.startTime, this.endTime, this.subject, this.note, {this.id});
}

@entity
class Thu {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'thutable')
  final String? startTime;
  final String? endTime;
  final String? subject;
  final String? note;
  Thu(this.startTime, this.endTime, this.subject, this.note, {this.id});
}

@entity
class Fri {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'fritable')
  final String? startTime;
  final String? endTime;
  final String? subject;
  final String? note;
  Fri(this.startTime, this.endTime, this.subject, this.note, {this.id});
}

@entity
class Sub {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'subtable')
  final String? subject;
  final String? subjectName;
  final String? teacher;
  Sub(this.subject, this.subjectName, this.teacher, {this.id});
}

@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'notetable')
  final String? date;
  final String? title;
  final String? contact;
  Note(this.date, this.title, this.contact, {this.id});
}

@entity
class Exam {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'examtable')
  final String? examDate;
  final String? examTime;
  final String? subject;
  final String? note;
  Exam(this.examDate, this.examTime, this.subject, this.note, {this.id});
}
