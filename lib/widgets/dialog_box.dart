import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';

class DialogBox extends StatelessWidget {
  
  final TextEditingController controler;
  final bool flag;

  DialogBox({
    super.key, 
    required this.controler, 
    required this.flag, 
  });

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: const Color(0xffC5FFF8),
      content: _Body(screen: screen, controler: controler, flag: flag),
    ); 
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.screen,
    required this.controler, 
    required this.flag, 
  });

  final Size screen;
  final TextEditingController controler;
  final bool flag;

  @override
  Widget build(BuildContext context) {

    final toDoProvider = Provider.of<ToDoProvider>(context);
    
    return Container(
      height: screen.height*0.40,
      width: screen.width*0.7,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Obtener entrada del usuario
          TextField(
            maxLines: 4,
            controller: controler,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
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
                onPressed: (){
                  if (controler.text != '') {

                    if ( flag ) {
                      toDoProvider.guardarNuevaTarea(controler.text, false);
                      Navigator.of(context).pop();
                      controler.clear();
                    } else {
                      toDoProvider.editarTarea(controler.text);
                      Navigator.of(context).pop();
                      controler.clear();
                    }

                  } else {
                    Navigator.of(context).pop();
                    controler.clear();
                  }
                },
              ),
                
              //boton de cancelar
              _MyButton(
                text: 'Cancelar',
                onPressed: (){
                  Navigator.of(context).pop();
                  controler.clear();
                },
              ),
    
            ],
          )
        ],
      ),
    );
  }
}

class _MyButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const _MyButton({
    super.key, 
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      elevation: 10,
      child: Text(
        text, 
        style: GoogleFonts.roboto(
          textStyle:  const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.white
        )
      ),
    ),
      
    );
  }
}