import 'package:flutter/material.dart';
import 'package:to_do_simple_con_provider/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final controler;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key, 
    required this.controler,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;

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
                MyButton(
                  text: 'Guardar', 
                  onPressed: onSave,
                ),

                // SizedBox(width: 8,),
                
                //boton de cancelar
                MyButton(
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