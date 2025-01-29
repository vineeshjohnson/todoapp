import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? id; // Document ID from Firestore
  final String title; // Title of the todo
  final String content; // Content/description of the todo
  final String deadline; // Deadline for the todo
  final bool completed; // Whether the todo is completed
  final bool deleted; // Whether the todo is deleted
  final bool failed; // Whether the todo has failed

  // Constructor
  TodoModel({
    this.id,
    required this.title,
    required this.content,
    required this.deadline,
    required this.completed,
    required this.deleted,
    required this.failed,
  });

  // Factory constructor to create an instance from Firestore
  factory TodoModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TodoModel(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      deadline: data['deadline'] ?? '',
      completed: data['completed'] ?? false,
      deleted: data['deleted'] ?? false,
      failed: data['failed'] ?? false,
    );
  }

  // Method to convert the model to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'content': content,
      'deadline': deadline,
      'completed': completed,
      'deleted': deleted,
      'failed': failed,
    };
  }
}
