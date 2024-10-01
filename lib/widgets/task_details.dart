import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/circle_container.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(20), // Slightly reduced padding for compact view
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Adjust size based on content
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
              size: 40, // Increased icon size for better emphasis
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22, // Slightly larger font size
            ),
            textAlign: TextAlign.center, // Center align the title
          ),
          const Gap(8),
          Text(
            task.time,
            style: style.titleMedium?.copyWith(color: Colors.grey), // Lighter text for time
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task to be completed on ',
                  style: style.bodyMedium,
                ),
                Text(
                  task.date,
                  style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                  size: 20, // Adjusted icon size to match text height
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: task.category.color,
            thickness: 1.5,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task.'
                : task.note,
            style: style.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task Completed',
                  style: style.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Gap(8),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20, // Smaller icon for task completion
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
