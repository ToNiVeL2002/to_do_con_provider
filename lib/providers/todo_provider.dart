import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/models/models.dart';
import 'package:to_do_simple_con_provider/providers/db_provider.dart';

class ToDoProvider extends ChangeNotifier {
  List<ToDoModel> tasks = [];


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

    notifyListeners();
  }

  editarTarea( String contenido, bool completado, int id ) async {
    final tareaEditada = new ToDoModel(contenido: contenido, completado: completado, id: id);
    await DBProvider.db.updateTask(tareaEditada);

    notifyListeners();

  }

  isCompleted( int id, bool completado ) async {
    int completo;

    completo = completado ? 1 : 0;

    await DBProvider.db.updateTaskCompletion(id, completo);

    notifyListeners();

  }
}

