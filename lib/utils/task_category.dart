import 'package:flutter/material.dart';

enum TaskCategory {
  education(
    icon: Icons.school,
    color: Colors.blueGrey,
    description: 'Education related tasks',
  ),
  health(
    icon: Icons.favorite,
    color: Colors.orange,
    description: 'Health and fitness',
  ),
  home(
    icon: Icons.home,
    color: Colors.green,
    description: 'Home related tasks',
  ),
  others(
    icon: Icons.calendar_month_rounded,
    color: Colors.purple,
    description: 'Miscellaneous tasks',
  ),
  personal(
    icon: Icons.person,
    color: Colors.lightBlue,
    description: 'Personal tasks',
  ),
  shopping(
    icon: Icons.shopping_bag,
    color: Colors.deepOrange,
    description: 'Shopping list',
  ),
  social(
    icon: Icons.people,
    color: Colors.brown,
    description: 'Social and group activities',
  ),
  travel(
    icon: Icons.flight,
    color: Colors.pink,
    description: 'Travel plans',
  ),
  work(
    icon: Icons.work,
    color: Colors.amber,
    description: 'Work-related tasks',
  );

  final IconData icon;
  final Color color;
  final String description; // Added a description for better UX

  const TaskCategory({
    required this.icon,
    required this.color,
    required this.description,
  });

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }
}
