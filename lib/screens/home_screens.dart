import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // controlador del texto
  final _controller = TextEditingController();

  // Lista de tareas para hacer
  List toDoList = [
    ['Hacer la apicacion', false],
    ['Hacer ejercicio', false],
  ];

  // Checkbox fue apretado
  void checkBoxChanged ( bool value, int index ) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Guardar la nueva tarea
  void saveNewTask() {
    setState(() {
      toDoList.add([ _controller.text, false ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Crear una nueva tarea
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {

        return DialogBox(
          controler: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          }
        );
      }
    );
  }

  // Eliminar una tarea
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          'TO DO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          const Background(),

          ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {

              return ToDoTile(
                taskName: toDoList[index][0], 
                taskCompleted: toDoList[index][1], 
                onChanged: ( value ) => checkBoxChanged(value!, index),
                deleteFunction: ( context ) => deleteTask(index),
              );
            }
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}