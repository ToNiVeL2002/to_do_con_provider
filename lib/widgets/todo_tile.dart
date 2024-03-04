import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/models/models.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class ToDoTile extends StatelessWidget {

  final ToDoModel todoModel;
  final int index;
  // var _controler = TextEditingController();


  ToDoTile({
    super.key, 
    required this.todoModel, 
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;

    final todoProvider = Provider.of<ToDoProvider>(context);
    final _controler = TextEditingController(text: todoModel.contenido);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      
      child: Slidable(
        // startActionPane: ActionPane(
        //   motion: ScrollMotion(), 
        //   children: [
        //     SlidableAction(
        //       onPressed: ( context ) {
        //         print('vamo a editar');
        //         todoProvider.obtenerIndex = index;

        //         showDialog(
        //           context: context, 
        //           builder: ( context ) {
        //             return DialogBox(
        //               controler: _controler, flag: false,
        //             );
        //           }
        //         );
        //       },
        //       icon: Icons.edit_outlined,
        //       label: 'Editar',
        //       backgroundColor: Colors.yellow.shade300,
        //       borderRadius: BorderRadius.circular(20),
        //     )
        //   ]
        // ),

        // endActionPane: ActionPane(
        //   motion: StretchMotion(), 
        //   children: [
        //     SlidableAction(
        //       onPressed: ( context ) => todoProvider.eliminar(index),
        //       icon: Icons.delete_outline,
        //       label: 'Eliminar',
        //       backgroundColor: Colors.red.shade300,
        //       borderRadius: BorderRadius.circular(20),
        //     )
        //   ]
        // ),
      
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20)
          ),
          
          child: _Content(screen: screen, contenido: todoModel.contenido, isCheck: todoModel.completado, index: index,),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  
  const _Content({
    super.key,
    required this.screen,
    required this.contenido, 
    required this.isCheck, 
    required this.index,
  });

  final Size screen;
  final String contenido;
  final bool isCheck;
  final int index;

  @override
  Widget build(BuildContext context) {
    
    final toDoProvider = Provider.of<ToDoProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screen.width * 0.75,
          child: Text(
            contenido,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 18,
                decoration: isCheck
                  ? TextDecoration.lineThrough
                  : TextDecoration.none
              )
            ),
          ),
        ),
    
        Checkbox(
          value: isCheck, 
          onChanged: (value) {
            toDoProvider.isCheck(value!, index);
          },
        )
      ],
    );
  }
}


