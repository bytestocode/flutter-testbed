import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_testbed/riverpod/riverpod_bed.dart';

class RiverpodBedSub extends ConsumerWidget {
  const RiverpodBedSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider);
    print('todos 리빌드');

    // Let's render the todos in a scrollable list view
    return Column(
      children: [
        Text('sub pabe'),
        Expanded(
          child: ListView(
            children: [
              for (final todo in todos)
                CheckboxListTile(
                  value: todo.completed,
                  // When tapping on the todo, change its completed status
                  onChanged: (_) {},
                  title: Text(todo.description),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
