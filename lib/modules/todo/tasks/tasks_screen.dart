import 'package:flutter/material.dart';
import 'package:flutter_1/shared/components/component.dart';
import 'package:flutter_1/shared/components/constanse.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => taskCard(task: tasks[index]),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[200],
      ),
      itemCount: tasks.length,
    );
  }
}
