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

}

// Checkbox fue apretado
  // void checkBoxChanged ( bool value, int index ) {
  //   setState(() {
  //     toDoList[index][1] = !toDoList[index][1];
  //   });
  // }

  // Guardar la nueva tarea
  // void saveNewTask() {
  //   setState(() {
  //     toDoList.add([ _controller.text, false ]);
  //     _controller.clear();
  //   });
  //   Navigator.of(context).pop();
  // }

  // Crear una nueva tarea
  // void createNewTask() {
  //   showDialog(
  //     context: context, 
  //     builder: (context) {

  //       return DialogBox(
  //         controler: _controller,
  //         onSave: saveNewTask,
  //         onCancel: () {
  //           Navigator.of(context).pop();
  //           _controller.clear();
  //         }
  //       );
  //     }
  //   );
  // }

  // Eliminar una tarea
  // void deleteTask(int index) {
  //   setState(() {
  //     toDoList.removeAt(index);
  //   });

  // }