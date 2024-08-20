import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/presentation/cubit/todo_cubit.dart';
import 'package:xtodo/src/todo/presentation/screens/todo_adding_screen.dart';
import 'package:xtodo/src/todo/presentation/widgets/todo_item_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<TodoEntity> _items = [];

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TodoCubit, TodoState>(
            listenWhen: (previous, current) =>
                previous.fetchingStatus != current.fetchingStatus &&
                current.fetchingStatus.isSuccess,
            listener: (context, state) {
              _items
                ..clear()
                ..addAll(state.todos);
            },
          ),
          BlocListener<TodoCubit, TodoState>(
            listenWhen: (previous, current) {
              return previous.addingStatus != current.addingStatus &&
                  current.addingStatus.isSuccess;
            },
            listener: (context, state) {
              listKey.currentState?.insertItem(0, duration: kTabScrollDuration);
              _items.insert(0, state.todos.first);
            },
          ),
          BlocListener<TodoCubit, TodoState>(
            listenWhen: (previous, current) {
              return previous.deletingStatus != current.deletingStatus &&
                  current.deletingStatus.isSuccess;
            },
            listener: (context, state) {
              final index = _items
                  .indexWhere((it) => it.id == state.lastDeletedTodos!.id);
              listKey.currentState?.removeItem(
                index,
                (_, animation) => TodoItemTile(
                  todo: state.lastDeletedTodos!,
                  animation: animation,
                ),
                duration: kTabScrollDuration,
              );
              _items.removeAt(index);
            },
          ),
        ],
        child: BlocBuilder<TodoCubit, TodoState>(
          buildWhen: (previous, current) =>
              previous.fetchingStatus != current.fetchingStatus &&
                  current.fetchingStatus.isSuccess ||
              previous.updatingStatus != current.updatingStatus &&
                  current.updatingStatus.isSuccess,
          builder: (context, state) {
            if (state.fetchingStatus.isLoading) return const Loader();

            return AnimatedList(
              physics: const BouncingScrollPhysics(),
              key: listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                final todo = _items[index];
                return TodoItemTile(
                  todo: todo,
                  animation: animation,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(Icons.add),
        onPressed: () => context.push(
          const TodoAddingScreen(),
        ),
      ),
    );
  }
}
