import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/presentation/cubit/todo_cubit.dart';

class TodoEditingScreen extends StatefulWidget {
  final TodoEntity todo;
  const TodoEditingScreen({super.key, required this.todo});

  @override
  State<TodoEditingScreen> createState() => _TodoEditingScreenState();
}

class _TodoEditingScreenState extends State<TodoEditingScreen> {
  final formKey = GlobalKey<FormState>();
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();

  List<String> selectedTopics = [];

  @override
  void initState() {
    super.initState();

    taskController.text = widget.todo.task;
    descriptionController.text = widget.todo.description;
  }

  void updateTodo() {
    if (formKey.currentState!.validate()) {
      widget.todo.task = taskController.text.trim();
      widget.todo.description = descriptionController.text.trim();

      context.read<TodoCubit>().updateTodo(widget.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update the task'),
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state.updatingStatus.isSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.updatingStatus.isLoading) return const Loader();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: taskController,
                      decoration: const InputDecoration(hintText: 'Task'),
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Task is missing!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Description'),
                      minLines: 3,
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Description is missing!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => updateTodo(),
        backgroundColor: Theme.of(context).primaryColorLight,
        label: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Center(
            child: Text(
              'Update',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
