import 'dart:async';

import 'package:path/path.dart';
import 'package:practice_dart/notes/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();

  static Database? _database;

  NoteDatabase._init();

  Future<Database?> get database async{
    if (_database != null) {
      return _database;
    }

    _database = await _initDB('notes.db');
    return _database;
  }

  Future<Database?> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future _createDB(Database db, int version) async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNotes (
    ${NoteFields.id} $idType,
    ${NoteFields.isImportant} $boolType,
    ${NoteFields.number} $integerType,
    ${NoteFields.title} $textType,
    ${NoteFields.description} $textType,
    ${NoteFields.createdTime} $textType 
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    const boolType = 'BOOLEAN DEFAULT 0';

    if (oldVersion == 1 && newVersion == 2) {
      await db.execute('''
      ALTER TABLE $tableNotes ADD COLUMN ${NoteFields.isActive} $boolType
      ''');
    }
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    final id = await db?.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note?> readNote(int id) async {
    final db = await instance.database;

    final maps = await db?.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id]
    );

    if (maps != null && maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id is nor found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${NoteFields.createdTime} ASC';

    final result = await db?.query(tableNotes,orderBy: orderBy);

    if (result != null && result.isNotEmpty) {
      return result.map((json) => Note.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<int?> update(Note note) async {
    final db = await instance.database;

    return await db?.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id]
    );
  }

  Future<int?> delete(int id) async {
    final db = await instance.database;

    return db?.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id]
    );
  }

  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}