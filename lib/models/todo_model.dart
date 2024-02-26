//quicktype.io

// To parse this JSON data, do
//
//     final toDoModel = toDoModelFromJson(jsonString);

import 'dart:convert';

ToDoModel toDoModelFromJson(String str) => ToDoModel.fromJson(json.decode(str));

String toDoModelToJson(ToDoModel data) => json.encode(data.toJson());

class ToDoModel {
    int? id;
    String contenido;
    bool check;

    ToDoModel({
        this.id,
        required this.contenido,
        required this.check,
    });

    factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        id: json["id"],
        contenido: json["contenido"],
        check: json["check"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "contenido": contenido,
        "completado": check ? 1 : 0,
    };
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