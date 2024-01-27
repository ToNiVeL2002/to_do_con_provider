import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/models/models.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  HomeScreen({Key? key}) : super(key: key);

  // controlador del texto
  final _controller = TextEditingController();
  List<ToDoModel> notas = [];

  @override
  Widget build(BuildContext context) {

    final toDoProvider = Provider.of<ToDoProvider>(context);

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
                taskName: toDoList[index].contenido, 
                taskCompleted: toDoList[index].check, 
                onChanged: ( value ) {
                  toDoProvider.isCheck(value ?? false, index);
                  
                  print('me apretaron ${index}');
                },
                deleteFunction: ( context ) {},
              );
            }
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // createNewTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}