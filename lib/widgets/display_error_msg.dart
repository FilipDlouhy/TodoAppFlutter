import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/utils/extensions.dart';
import 'common_container.dart';

class DisplayErrorMessage extends StatelessWidget {
  const DisplayErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return CommonContainer(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      padding: const EdgeInsets.all(16.0), // Added padding for better spacing
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.redAccent,
            size: 40, // Large error icon for visual emphasis
          ),
          const SizedBox(height: 16), // Space between icon and text
          const Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent, // Red color for the error message
            ),
            textAlign: TextAlign.center, // Centered text alignment
          ),
        ],
      ),
    );
  }
}
