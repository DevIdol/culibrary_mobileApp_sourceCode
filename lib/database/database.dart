import 'package:floor/floor.dart';
import 'dao.dart';
import 'table.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [Mon, Tue, Wed, Thu, Fri, Sub, Note, Exam])
abstract class MyDatabase extends FloorDatabase {
  MonDao get monDao;
  TueDao get tueDao;
  WedDao get wedDao;
  ThuDao get thuDao;
  FriDao get friDao;
  SubDao get subDao;
  NoteDao get noteDao;
  ExamDao get examDao;
}
