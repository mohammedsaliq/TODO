import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_code_generation/Model/todo_model.dart';

part 'todo_controller.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  List<TodoModel> build() {
    return [];
  }

  void addTodo(String text) {
    state = [...state, TodoModel(title: text)];
  }

  void updateTodo(bool value, int index) {
    List temp = state;
    temp[index] = TodoModel(title: state[index].title, isCompleted: value);
    state = List.from(temp);
  }

  void deleteTodo(int index) {
    List temp = state;
    temp.removeAt(index);
    state = List.from(temp);
  }

  void editTodo(String text, int index) {
    List temp = state;
    temp[index] = TodoModel(title: text);
    state = List.from(temp);
  }
}
