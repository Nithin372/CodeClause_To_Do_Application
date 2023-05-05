import 'package:flutter/material.dart';
import 'package:to_do_app/constatnts/colors.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key,
      required this.todo,
      required this.todoischanged,
      required this.todeleteitem});
  final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  final todoischanged;
  // ignore: prefer_typing_uninitialized_variables
  final todeleteitem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            todoischanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: tdbgcolor,
          leading: Icon(
            todo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdblue,
          ),
          title: Text(
            todo.todotext!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              decoration: todo.isdone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: tdred, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              color: Colors.white70,
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                todeleteitem(todo.id);
              },
            ),
          ),
        ));
  }
}
