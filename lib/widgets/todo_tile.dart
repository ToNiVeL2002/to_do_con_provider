import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/models/todo_model.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/widgets/widgets.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function( bool? )? onChanged;
  Function(BuildContext)? deleteFunction;
  // Function(BuildContext)? editFunction;
  final TextEditingController? controller;
  final int? index; 


  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    this.controller,
    this.index
    // required this.index,
    // required this.editFunction,
  });

  

  @override
  Widget build(BuildContext context) {
    
    final toDoProvider = Provider.of<ToDoProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 15, top: 25, bottom: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(), 
          children: [
            SlidableAction(
              onPressed: (context) {
                showDialog(
                  context: context, 
                  builder: (context) {
                    
                    return DialogBox(
                      x: toDoList[index!].contenido,
                      controler: controller, 
                      onSave: (){
                        toDoProvider.editarTarea(controller!.text, index!);
                        Navigator.of(context).pop();
                        controller!.clear();
                      }, 
                      onCancel: (){
                        Navigator.of(context).pop();
                        controller!.clear();
                      }
                    );
                  },
                );
                
              }, 
              icon: Icons.edit_outlined,
              label: 'Editar',
              backgroundColor: Colors.yellow.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ]
        ),

        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_outline_rounded,
              label: 'Eliminar',
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xff5FBDFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}

