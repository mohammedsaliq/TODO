import 'package:flutter/material.dart';

class AddTodoUtil {
  static Future<dynamic> addTodoDialog({
    required BuildContext context,
    required TextEditingController controller,
    required VoidCallback onAdd,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Add Todo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onAdd,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
