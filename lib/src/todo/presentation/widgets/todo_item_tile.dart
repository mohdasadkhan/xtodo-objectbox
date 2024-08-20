import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/presentation/cubit/todo_cubit.dart';
import 'package:xtodo/src/todo/presentation/screens/todo_editing_screen.dart';

class TodoItemTile extends StatelessWidget {
  final TodoEntity todo;
  final Animation<double> animation;

  const TodoItemTile({
    super.key,
    required this.todo,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (context) => showDeleteDialog(context),
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              icon: CupertinoIcons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          onTap: () => context.push(TodoEditingScreen(todo: todo)),
          leading: Checkbox(
            key: Key(todo.id.toString()),
            value: todo.isCompleted,
            onChanged: (val) {
              if (val == null) return;
              todo.isCompleted = val;
              context.read<TodoCubit>().updateTodo(todo);
            },
          ),
          title: Text(
            todo.task,
            style: TextStyle(
              fontSize: 16,
              color: todo.isCompleted ? Colors.grey.shade700 : null,
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Delete that task"),
        content: const Text("Are sure to delete this task?"),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: const Text("Cancel"),
          ),
          TextButton(
            child: const Text("Yes, Delete It!"),
            onPressed: () {
              context
                ..read<TodoCubit>().deleteTodo(todo)
                ..pop();
            },
          ),
        ],
      ),
    );
  }
}
