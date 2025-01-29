import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';

class TodoDetailsScreen extends StatelessWidget {
  final TodoModel todo;

  const TodoDetailsScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              title: "Content",
              content: todo.content,
              context: context,
            ),
            _buildDetailCard(
              title: "Deadline",
              content: todo.deadline,
              context: context,
            ),
            _buildStatusCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String content,
    required BuildContext context,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              todo.completed
                  ? Icons.check_circle
                  : todo.failed
                      ? Icons.cancel
                      : Icons.access_time,
              color: todo.completed
                  ? Colors.green
                  : todo.failed
                      ? Colors.red
                      : Colors.orange,
              size: 30,
            ),
            const SizedBox(width: 12),
            Text(
              todo.completed
                  ? "Completed"
                  : todo.failed
                      ? "Failed"
                      : "In Progress",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: todo.completed
                        ? Colors.green
                        : todo.failed
                            ? Colors.red
                            : Colors.orange,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
