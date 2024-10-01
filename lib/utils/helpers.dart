import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import 'package:intl/intl.dart';

@immutable
class Helpers {
  const Helpers._();

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final DateTime formattedTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      return DateFormat.jm().format(formattedTime); // 12-hour format with am/pm
    } catch (e) {
      return '12:00 PM'; // Default fallback time with clearer format
    }
  }

  static Future<void> selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(), // Set first date as the current date
      lastDate: DateTime(2060),
      helpText: 'Select a date for your task', // Add some help text
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blueAccent, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = _parseDateString(task.date);
    return taskDate.year == selectedDate.year &&
        taskDate.month == selectedDate.month &&
        taskDate.day == selectedDate.day;
  }

  static DateTime _parseDateString(String dateString) {
    try {
      return DateFormat.yMMMd().parse(dateString);
    } catch (e) {
      return DateTime.now(); // Return current date on error
    }
  }

  static String dateFormatter(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date); // Formats date to 'Jan 1, 2024'
    } catch (e) {
      return DateFormat.yMMMd().format(DateTime.now());
    }
  }
}
