import 'package:floor/floor.dart';

import 'table.dart';

@dao
abstract class MonDao {
  @Query('select * from Mon')
  Stream<List<Mon>> getAllMons();

  @insert
  Future<void> addMon(Mon mon);

  @delete
  Future<void> deleteMon(Mon mon);

  @update
  Future<void> updateMon(Mon mon);

  @delete
  Future<void> deletAllMons(List<Mon> mons);
}

@dao
abstract class TueDao {
  @Query('select * from Tue')
  Stream<List<Tue>> getAllTues();

  @insert
  Future<void> addTue(Tue tue);

  @delete
  Future<void> deleteTue(Tue tue);

  @update
  Future<void> updateTue(Tue tue);

  @delete
  Future<void> deletAllTues(List<Tue> tues);
}

@dao
abstract class WedDao {
  @Query('select * from Wed')
  Stream<List<Wed>> getAllWeds();

  @insert
  Future<void> addWed(Wed wed);

  @delete
  Future<void> deleteWed(Wed wed);

  @update
  Future<void> updateWed(Wed wed);

  @delete
  Future<void> deletAllWeds(List<Wed> weds);
}

@dao
abstract class ThuDao {
  @Query('select * from Thu')
  Stream<List<Thu>> getAllThus();

  @insert
  Future<void> addThu(Thu thu);

  @delete
  Future<void> deleteThu(Thu thu);

  @update
  Future<void> updateThu(Thu thu);

  @delete
  Future<void> deletAllThus(List<Thu> thus);
}

@dao
abstract class FriDao{
  @Query('select * from Fri')
  Stream<List<Fri>> getAllFris();

  @insert
  Future<void> addFri(Fri fri);

  @delete
  Future<void> deleteFri(Fri fri);

  @update
  Future<void> updateFri(Fri fri);

  @delete
  Future<void> deletAllFris(List<Fri> fris);
}

@dao
abstract class SubDao {
  @Query('select * from Sub')
  Stream<List<Sub>> getAllSubs();

  @insert
  Future<void> addSub(Sub sub);

  @delete
  Future<void> deleteSub(Sub sub);

  @update
  Future<void> updateSub(Sub sub);

  @delete
  Future<void> deletAllSubs(List<Sub> subs);
}

@dao
abstract class NoteDao {
  @Query('select * from Note')
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deletAllNotes(List<Note> notes);
}

@dao
abstract class ExamDao {
  @Query('select * from Exam')
  Stream<List<Exam>> getAllExams();

  @insert
  Future<void> addExam(Exam exam);

  @delete
  Future<void> deleteExam(Exam exam);

  @update
  Future<void> updateExam(Exam exam);

  @delete
  Future<void> deletAllExams(List<Exam> exams);
}