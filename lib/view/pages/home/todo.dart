import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_code_generation/controller/todo_controller.dart';
import 'package:todo_code_generation/core/utils/todo_dialog.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    final todoReadList = ref.read(todoProvider.notifier);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todoList[index].title),
              onDismissed: (_) {
                todoReadList.deleteTodo(index);
              },
              child: InkWell(
                onLongPress: () => AddTodoUtil.addTodoDialog(
                  context: context,
                  controller: controller,
                  onAdd: () {
                    todoReadList.editTodo(controller.text, index);
                  },
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: todoList[index].isCompleted,
                    onChanged: (bool? value) {
                      todoReadList.updateTodo(value!, index);
                    },
                  ),
                  title: Text(todoList[index].title),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: todoList.length),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('add'),
        onPressed: () {
          AddTodoUtil.addTodoDialog(
            context: context,
            controller: controller,
            onAdd: () {
              if (controller.text.isNotEmpty) {
                todoReadList.addTodo(controller.text);
                controller.clear();
              }
            },
          );
        },
      ),
    );
  }
}
