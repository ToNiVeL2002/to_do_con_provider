import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  HomeScreen({Key? key}) : super(key: key);

  // controlador del texto
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          const Background(),

          _Body(), 
          
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {

              return DialogBox(
                controler: _controller,
                flag: true,
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

  @override
  Widget build(BuildContext context) {

    final todoProvider = Provider.of<ToDoProvider>(context);
    todoProvider.cargarTareas();
    var tasks = todoProvider.tasks;
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 5),
      
      child: Column(
        children: [
          const _Title(),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ToDoTile(todoModel: tasks[index]);
              }
            )
          ),
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
      padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
      child: Row(
        children: [
          Text(
            'Pendientes',
            style: GoogleFonts.archivoBlack(
              textStyle: const TextStyle(
                fontSize: 30,
              )
            ),
          )
        ],
      ),
    );
  }
}