class ToDoModel {
  String contenido;
  bool check;

  ToDoModel({
    required this.contenido,
    required this.check
  });
}


// Lista de tareas para hacer
  List<ToDoModel> toDoList = [
    ToDoModel(
      contenido: 'Hacer el disenio', 
      check: false
    ),

    ToDoModel(
      contenido: 'Implementar Provider', 
      check: false
    ),
  ];