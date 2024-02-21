import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/models/models.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  HomeScreen({Key? key}) : super(key: key);

  // controlador del texto
  final _controller = TextEditingController();
  // List<ToDoModel> notas = [];

  @override
  Widget build(BuildContext context) {

    final toDoProvider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'PENDIENTES',
      //     style: GoogleFonts.archivoBlack()
      //   ),
      //   // centerTitle: true,
      // ),

      body: Stack(
        children: [
          const Background(),

          _Body(toDoProvider: toDoProvider,), 
          
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // createNewTask();
          showDialog(
            context: context, 
            builder: (context) {

              return DialogBox(
                controler: _controller,
                onSave: () {
                  toDoProvider.guardarNuevaTarea(_controller.text, false);
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                  _controller.clear();
                }
              );
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  
  final ToDoProvider toDoProvider;

  const _Body({
    super.key, 
    required this.toDoProvider
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 5),
      child: Column(
        children: [
          _Title(),

          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(todoModel: toDoList[index], index: index,);
              }
            )
          )

          
        ],


      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              'Pendientes',
              style: GoogleFonts.archivoBlack(
                textStyle: TextStyle(
                  fontSize: 30,
                )
              ),
            )
          ],
        ),
      );
  }
}