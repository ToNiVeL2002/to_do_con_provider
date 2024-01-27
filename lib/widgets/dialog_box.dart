import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';

class DialogBox extends StatelessWidget {
  final controler;
  VoidCallback onSave;
  VoidCallback onCancel;
  String? x;

  DialogBox({
    super.key, 
    required this.controler,
    required this.onSave,
    required this.onCancel,
    this.x
  });

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final toDoProvider = Provider.of<ToDoProvider>(context);

    return AlertDialog(
      backgroundColor: const Color(0xffC5FFF8),
      content: Container(
        height: screen.height*0.25,
        width: screen.width*0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Obtener entrada del usuario
            TextField(
              // controller: toDoProvider.flag 
              // ? TextEditingController(text: x)
              // : controler,
              controller: controler,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Añade una nueva tarea',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // boton de guardar
                _MyButton(
                  text: 'Guardar', 
                  onPressed: onSave,
                ),

                // SizedBox(width: 8,),
                
                //boton de cancelar
                _MyButton(
                  text: 'Cancelar', 
                  onPressed: onCancel,
                ),

              ],
            )
          ],
        ),
      ),
    ); 
  }
}

class _MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  _MyButton({
    super.key, 
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        text, 
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20
        ),
      ),
      
    );
  }
}