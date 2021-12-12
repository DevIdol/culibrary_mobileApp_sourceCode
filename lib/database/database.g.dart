// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMyDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder databaseBuilder(String name) =>
      _$MyDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MyDatabaseBuilder(null);
}

class _$MyDatabaseBuilder {
  _$MyDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MyDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MyDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MyDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MyDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MyDatabase extends MyDatabase {
  _$MyDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MonDao? _monDaoInstance;

  TueDao? _tueDaoInstance;

  WedDao? _wedDaoInstance;

  ThuDao? _thuDaoInstance;

  FriDao? _friDaoInstance;

  SubDao? _subDaoInstance;

  NoteDao? _noteDaoInstance;

  ExamDao? _examDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Mon` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `montable` TEXT, `endTime` TEXT, `subject` TEXT, `note` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tue` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `tuetable` TEXT, `endTime` TEXT, `subject` TEXT, `note` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Wed` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `wedtable` TEXT, `endTime` TEXT, `subject` TEXT, `note` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Thu` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `thutable` TEXT, `endTime` TEXT, `subject` TEXT, `note` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Fri` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fritable` TEXT, `endTime` TEXT, `subject` TEXT, `note` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Sub` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `subtable` TEXT, `subjectName` TEXT, `teacher` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `notetable` TEXT, `title` TEXT, `contact` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Exam` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `examtable` TEXT, `examTime` TEXT, `subject` TEXT, `note` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MonDao get monDao {
    return _monDaoInstance ??= _$MonDao(database, changeListener);
  }

  @override
  TueDao get tueDao {
    return _tueDaoInstance ??= _$TueDao(database, changeListener);
  }

  @override
  WedDao get wedDao {
    return _wedDaoInstance ??= _$WedDao(database, changeListener);
  }

  @override
  ThuDao get thuDao {
    return _thuDaoInstance ??= _$ThuDao(database, changeListener);
  }

  @override
  FriDao get friDao {
    return _friDaoInstance ??= _$FriDao(database, changeListener);
  }

  @override
  SubDao get subDao {
    return _subDaoInstance ??= _$SubDao(database, changeListener);
  }

  @override
  NoteDao get noteDao {
    return _noteDaoInstance ??= _$NoteDao(database, changeListener);
  }

  @override
  ExamDao get examDao {
    return _examDaoInstance ??= _$ExamDao(database, changeListener);
  }
}

class _$MonDao extends MonDao {
  _$MonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _monInsertionAdapter = InsertionAdapter(
            database,
            'Mon',
            (Mon item) => <String, Object?>{
                  'id': item.id,
                  'montable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _monUpdateAdapter = UpdateAdapter(
            database,
            'Mon',
            ['id'],
            (Mon item) => <String, Object?>{
                  'id': item.id,
                  'montable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _monDeletionAdapter = DeletionAdapter(
            database,
            'Mon',
            ['id'],
            (Mon item) => <String, Object?>{
                  'id': item.id,
                  'montable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Mon> _monInsertionAdapter;

  final UpdateAdapter<Mon> _monUpdateAdapter;

  final DeletionAdapter<Mon> _monDeletionAdapter;

  @override
  Stream<List<Mon>> getAllMons() {
    return _queryAdapter.queryListStream('select * from Mon',
        mapper: (Map<String, Object?> row) => Mon(
            row['montable'] as String?,
            row['endTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Mon',
        isView: false);
  }

  @override
  Future<void> addMon(Mon mon) async {
    await _monInsertionAdapter.insert(mon, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMon(Mon mon) async {
    await _monUpdateAdapter.update(mon, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMon(Mon mon) async {
    await _monDeletionAdapter.delete(mon);
  }

  @override
  Future<void> deletAllMons(List<Mon> mons) async {
    await _monDeletionAdapter.deleteList(mons);
  }
}

class _$TueDao extends TueDao {
  _$TueDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _tueInsertionAdapter = InsertionAdapter(
            database,
            'Tue',
            (Tue item) => <String, Object?>{
                  'id': item.id,
                  'tuetable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _tueUpdateAdapter = UpdateAdapter(
            database,
            'Tue',
            ['id'],
            (Tue item) => <String, Object?>{
                  'id': item.id,
                  'tuetable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _tueDeletionAdapter = DeletionAdapter(
            database,
            'Tue',
            ['id'],
            (Tue item) => <String, Object?>{
                  'id': item.id,
                  'tuetable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Tue> _tueInsertionAdapter;

  final UpdateAdapter<Tue> _tueUpdateAdapter;

  final DeletionAdapter<Tue> _tueDeletionAdapter;

  @override
  Stream<List<Tue>> getAllTues() {
    return _queryAdapter.queryListStream('select * from Tue',
        mapper: (Map<String, Object?> row) => Tue(
            row['tuetable'] as String?,
            row['endTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Tue',
        isView: false);
  }

  @override
  Future<void> addTue(Tue tue) async {
    await _tueInsertionAdapter.insert(tue, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTue(Tue tue) async {
    await _tueUpdateAdapter.update(tue, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTue(Tue tue) async {
    await _tueDeletionAdapter.delete(tue);
  }

  @override
  Future<void> deletAllTues(List<Tue> tues) async {
    await _tueDeletionAdapter.deleteList(tues);
  }
}

class _$WedDao extends WedDao {
  _$WedDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _wedInsertionAdapter = InsertionAdapter(
            database,
            'Wed',
            (Wed item) => <String, Object?>{
                  'id': item.id,
                  'wedtable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _wedUpdateAdapter = UpdateAdapter(
            database,
            'Wed',
            ['id'],
            (Wed item) => <String, Object?>{
                  'id': item.id,
                  'wedtable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _wedDeletionAdapter = DeletionAdapter(
            database,
            'Wed',
            ['id'],
            (Wed item) => <String, Object?>{
                  'id': item.id,
                  'wedtable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wed> _wedInsertionAdapter;

  final UpdateAdapter<Wed> _wedUpdateAdapter;

  final DeletionAdapter<Wed> _wedDeletionAdapter;

  @override
  Stream<List<Wed>> getAllWeds() {
    return _queryAdapter.queryListStream('select * from Wed',
        mapper: (Map<String, Object?> row) => Wed(
            row['wedtable'] as String?,
            row['endTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Wed',
        isView: false);
  }

  @override
  Future<void> addWed(Wed wed) async {
    await _wedInsertionAdapter.insert(wed, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWed(Wed wed) async {
    await _wedUpdateAdapter.update(wed, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWed(Wed wed) async {
    await _wedDeletionAdapter.delete(wed);
  }

  @override
  Future<void> deletAllWeds(List<Wed> weds) async {
    await _wedDeletionAdapter.deleteList(weds);
  }
}

class _$ThuDao extends ThuDao {
  _$ThuDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _thuInsertionAdapter = InsertionAdapter(
            database,
            'Thu',
            (Thu item) => <String, Object?>{
                  'id': item.id,
                  'thutable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _thuUpdateAdapter = UpdateAdapter(
            database,
            'Thu',
            ['id'],
            (Thu item) => <String, Object?>{
                  'id': item.id,
                  'thutable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _thuDeletionAdapter = DeletionAdapter(
            database,
            'Thu',
            ['id'],
            (Thu item) => <String, Object?>{
                  'id': item.id,
                  'thutable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Thu> _thuInsertionAdapter;

  final UpdateAdapter<Thu> _thuUpdateAdapter;

  final DeletionAdapter<Thu> _thuDeletionAdapter;

  @override
  Stream<List<Thu>> getAllThus() {
    return _queryAdapter.queryListStream('select * from Thu',
        mapper: (Map<String, Object?> row) => Thu(
            row['thutable'] as String?,
            row['endTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Thu',
        isView: false);
  }

  @override
  Future<void> addThu(Thu thu) async {
    await _thuInsertionAdapter.insert(thu, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateThu(Thu thu) async {
    await _thuUpdateAdapter.update(thu, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteThu(Thu thu) async {
    await _thuDeletionAdapter.delete(thu);
  }

  @override
  Future<void> deletAllThus(List<Thu> thus) async {
    await _thuDeletionAdapter.deleteList(thus);
  }
}

class _$FriDao extends FriDao {
  _$FriDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _friInsertionAdapter = InsertionAdapter(
            database,
            'Fri',
            (Fri item) => <String, Object?>{
                  'id': item.id,
                  'fritable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _friUpdateAdapter = UpdateAdapter(
            database,
            'Fri',
            ['id'],
            (Fri item) => <String, Object?>{
                  'id': item.id,
                  'fritable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _friDeletionAdapter = DeletionAdapter(
            database,
            'Fri',
            ['id'],
            (Fri item) => <String, Object?>{
                  'id': item.id,
                  'fritable': item.startTime,
                  'endTime': item.endTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Fri> _friInsertionAdapter;

  final UpdateAdapter<Fri> _friUpdateAdapter;

  final DeletionAdapter<Fri> _friDeletionAdapter;

  @override
  Stream<List<Fri>> getAllFris() {
    return _queryAdapter.queryListStream('select * from Fri',
        mapper: (Map<String, Object?> row) => Fri(
            row['fritable'] as String?,
            row['endTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Fri',
        isView: false);
  }

  @override
  Future<void> addFri(Fri fri) async {
    await _friInsertionAdapter.insert(fri, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateFri(Fri fri) async {
    await _friUpdateAdapter.update(fri, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteFri(Fri fri) async {
    await _friDeletionAdapter.delete(fri);
  }

  @override
  Future<void> deletAllFris(List<Fri> fris) async {
    await _friDeletionAdapter.deleteList(fris);
  }
}

class _$SubDao extends SubDao {
  _$SubDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _subInsertionAdapter = InsertionAdapter(
            database,
            'Sub',
            (Sub item) => <String, Object?>{
                  'id': item.id,
                  'subtable': item.subject,
                  'subjectName': item.subjectName,
                  'teacher': item.teacher
                },
            changeListener),
        _subUpdateAdapter = UpdateAdapter(
            database,
            'Sub',
            ['id'],
            (Sub item) => <String, Object?>{
                  'id': item.id,
                  'subtable': item.subject,
                  'subjectName': item.subjectName,
                  'teacher': item.teacher
                },
            changeListener),
        _subDeletionAdapter = DeletionAdapter(
            database,
            'Sub',
            ['id'],
            (Sub item) => <String, Object?>{
                  'id': item.id,
                  'subtable': item.subject,
                  'subjectName': item.subjectName,
                  'teacher': item.teacher
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Sub> _subInsertionAdapter;

  final UpdateAdapter<Sub> _subUpdateAdapter;

  final DeletionAdapter<Sub> _subDeletionAdapter;

  @override
  Stream<List<Sub>> getAllSubs() {
    return _queryAdapter.queryListStream('select * from Sub',
        mapper: (Map<String, Object?> row) => Sub(row['subtable'] as String?,
            row['subjectName'] as String?, row['teacher'] as String?,
            id: row['id'] as int?),
        queryableName: 'Sub',
        isView: false);
  }

  @override
  Future<void> addSub(Sub sub) async {
    await _subInsertionAdapter.insert(sub, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSub(Sub sub) async {
    await _subUpdateAdapter.update(sub, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSub(Sub sub) async {
    await _subDeletionAdapter.delete(sub);
  }

  @override
  Future<void> deletAllSubs(List<Sub> subs) async {
    await _subDeletionAdapter.deleteList(subs);
  }
}

class _$NoteDao extends NoteDao {
  _$NoteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _noteInsertionAdapter = InsertionAdapter(
            database,
            'Note',
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'notetable': item.date,
                  'title': item.title,
                  'contact': item.contact
                },
            changeListener),
        _noteUpdateAdapter = UpdateAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'notetable': item.date,
                  'title': item.title,
                  'contact': item.contact
                },
            changeListener),
        _noteDeletionAdapter = DeletionAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, Object?>{
                  'id': item.id,
                  'notetable': item.date,
                  'title': item.title,
                  'contact': item.contact
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Note> _noteInsertionAdapter;

  final UpdateAdapter<Note> _noteUpdateAdapter;

  final DeletionAdapter<Note> _noteDeletionAdapter;

  @override
  Stream<List<Note>> getAllNotes() {
    return _queryAdapter.queryListStream('select * from Note',
        mapper: (Map<String, Object?> row) => Note(row['notetable'] as String?,
            row['title'] as String?, row['contact'] as String?,
            id: row['id'] as int?),
        queryableName: 'Note',
        isView: false);
  }

  @override
  Future<void> addNote(Note note) async {
    await _noteInsertionAdapter.insert(note, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNote(Note note) async {
    await _noteUpdateAdapter.update(note, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await _noteDeletionAdapter.delete(note);
  }

  @override
  Future<void> deletAllNotes(List<Note> notes) async {
    await _noteDeletionAdapter.deleteList(notes);
  }
}

class _$ExamDao extends ExamDao {
  _$ExamDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _examInsertionAdapter = InsertionAdapter(
            database,
            'Exam',
            (Exam item) => <String, Object?>{
                  'id': item.id,
                  'examtable': item.examDate,
                  'examTime': item.examTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _examUpdateAdapter = UpdateAdapter(
            database,
            'Exam',
            ['id'],
            (Exam item) => <String, Object?>{
                  'id': item.id,
                  'examtable': item.examDate,
                  'examTime': item.examTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener),
        _examDeletionAdapter = DeletionAdapter(
            database,
            'Exam',
            ['id'],
            (Exam item) => <String, Object?>{
                  'id': item.id,
                  'examtable': item.examDate,
                  'examTime': item.examTime,
                  'subject': item.subject,
                  'note': item.note
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Exam> _examInsertionAdapter;

  final UpdateAdapter<Exam> _examUpdateAdapter;

  final DeletionAdapter<Exam> _examDeletionAdapter;

  @override
  Stream<List<Exam>> getAllExams() {
    return _queryAdapter.queryListStream('select * from Exam',
        mapper: (Map<String, Object?> row) => Exam(
            row['examtable'] as String?,
            row['examTime'] as String?,
            row['subject'] as String?,
            row['note'] as String?,
            id: row['id'] as int?),
        queryableName: 'Exam',
        isView: false);
  }

  @override
  Future<void> addExam(Exam exam) async {
    await _examInsertionAdapter.insert(exam, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExam(Exam exam) async {
    await _examUpdateAdapter.update(exam, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExam(Exam exam) async {
    await _examDeletionAdapter.delete(exam);
  }

  @override
  Future<void> deletAllExams(List<Exam> exams) async {
    await _examDeletionAdapter.deleteList(exams);
  }
}
