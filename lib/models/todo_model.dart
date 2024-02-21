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
      contenido: 'Quis ipsum magna ea Lorem aute culpa tempor exercitation exercitation do veniam aliqua veniam veniam.', 
      check: false
    ),

    ToDoModel(
      contenido: 'Ullamco aute esse nostrud consectetur qui aliqua adipisicing.', 
      check: false
    ),

    ToDoModel(
      contenido: 'Consectetur officia qui aliqua anim enim nostrud cupidatat ipsum irure id anim culpa. Dolor deserunt voluptate excepteur consectetur eu labore nisi qui magna laboris qui.', 
      check: false
    ),

    ToDoModel(
      contenido: 'Cillum consequat dolor culpa commodo anim sint consequat ipsum enim est fugiat mollit nulla.', 
      check: false
    ),
  ];