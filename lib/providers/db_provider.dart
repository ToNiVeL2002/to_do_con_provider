import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:to_do_simple_con_provider/models/models.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if ( _database != null ) {
      
      return _database;
    }

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'TasksDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version) async {
        
        await db.execute(''' 
          CREATE TABLE Tasks(
            id INTEGER PRIMARY KEY,
            contenido TEXT,
            completado INTEGER
          )
        ''');

      },
    );
  }

  Future<int> nuevaTaskRa( ToDoModel nuevoToDo ) async {

    final id          = nuevoToDo.id;
    final contenido   = nuevoToDo.contenido;
    final completado  = nuevoToDo.completado ? 1 : 0;

    // Verificar la base de datos
    final db = await database;

    final res = await db?.rawInsert('''
      INSERT INTO Tasks( id, contenido, completado )
        VALUES( $id, '$contenido', $completado )
    ''');

    return res!;
  }

  Future<int> nuevaTask( ToDoModel nuevoToDo ) async {
    final db = await database;
    final res = await db?.insert( 'Tasks', nuevoToDo.toJson() );

    print(res);

    // Es el ID del ultimo registro INSERTADO
    return res!;
  }

  Future<List<ToDoModel>?> getTodosTasks() async {
    final db = await database;
    final res = await db!.query('Tasks');

    return res.isNotEmpty
      ? res.map( (e) => ToDoModel.fromJson(e) ).toList()
      : [];
  }

  Future<ToDoModel?> getTaskById( int id ) async {
    final db = await database;
    final res = await db!.query('Tasks', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
      ? ToDoModel.fromJson( res.first )
      : null;
  }

  Future<int> updateTask( ToDoModel nuevaTask ) async {
    final db = await database;
    final res = await db!.update('Tasks', nuevaTask.toJson(), where: 'id = ?', whereArgs: [nuevaTask.id]);

    return res;
  }

  Future<int> updateTaskCompletion(int taskId, int completionStatus) async {
    final db = await database;
    final Map<String, dynamic> updateValues = {
      'completado': completionStatus,
    };
    final res = await db!.update('Tasks', updateValues, where: 'id = ?', whereArgs: [taskId]);
    
    return res;
  }

  Future<int> deleteTask( int id ) async{
    final db = await database;
    final res = await db!.delete('Tasks', where: 'id = ?', whereArgs: [id]);

    return res;
  }
}

