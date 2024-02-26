import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

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
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        
      },
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
    final completado  = nuevoToDo.check ? 1 : 0;

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

}

