import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/models/models.dart';

class ToDoProvider extends ChangeNotifier {
  bool _check = false;
  int _index = 0;

  get check => _check;

  get index => _index;
  set obtenerIndex( int value ) => _index = value;
  
  void isCheck( bool value, int index ) {
    _check = value;

    toDoList[index].check = value;
    
    notifyListeners();
  }

  void eliminar( int index ) {

    toDoList.removeAt(index);
    
    notifyListeners();
  }

  void guardarNuevaTarea( String contenido, bool check ) {
    toDoList.add(ToDoModel(contenido: contenido, check: check));

    notifyListeners();
  }

  void editarTarea( String contenido ) {
    toDoList[_index].contenido = contenido;
    
    notifyListeners();
  }


}

