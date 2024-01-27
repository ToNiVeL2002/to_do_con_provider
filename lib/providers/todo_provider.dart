import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/models/models.dart';

class ToDoProvider extends ChangeNotifier {
  bool _check = false;

  get check => _check;
  
  void isCheck ( bool value, int index ) {
    _check = value;

    toDoList[index].check = value;
    
    notifyListeners();
  }

  void eliminar ( int index ) {

    toDoList.removeAt(index);
    
    notifyListeners();
  }

  void guardarNuevaTarea(String contenido, bool check ) {
    toDoList.add(ToDoModel(contenido: contenido, check: check));

    notifyListeners();
  }

}

