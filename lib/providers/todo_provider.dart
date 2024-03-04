import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/models/models.dart';
import 'package:to_do_simple_con_provider/providers/db_provider.dart';

class ToDoProvider extends ChangeNotifier {
  List<ToDoModel> tasks = [];

  bool _check = false;
  int _index = 0;

  get check => _check;

  get index => _index;
  set obtenerIndex( int value ) => _index = value;
  
  void isCheck( bool value, int index ) {
    _check = value;

    toDoList[index].completado = value;
    
    notifyListeners();
  }

  void eliminar( int index ) {

    toDoList.removeAt(index);
    
    notifyListeners();
  }

  void guardarNuevaTarea( String contenido, bool completado ) {
    toDoList.add(ToDoModel(contenido: contenido, completado: completado));

    notifyListeners();
  }

  void editarTarea( String contenido ) {
    toDoList[_index].contenido = contenido;
    
    notifyListeners();
  }

  nuevaTarea( String contenido, bool completado ) async {
    final nuevaTarea = new ToDoModel(contenido: contenido, completado: completado);
    final id = await DBProvider.db.nuevaTask(nuevaTarea);

    nuevaTarea.id = id;

    this.tasks.add(nuevaTarea);
    notifyListeners();
  }

  cargarTareas() async {
    final task = await DBProvider.db.getTodosTasks();
    this.tasks = [...?task];

    notifyListeners();
  }

  borrarTareaById( int id ) async {
    await DBProvider.db.deleteTask(id);

    cargarTareas();
    notifyListeners();
  }

}

