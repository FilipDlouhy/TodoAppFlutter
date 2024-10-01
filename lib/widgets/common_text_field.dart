import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.title,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String hintText;
  final String title;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // Added optional prefix icon
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold, // Bold text for title
            color: context.colorScheme.onBackground.withOpacity(0.8), // Slightly reduced opacity
          ),
        ),
        const Gap(10),
        TextField(
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon, // New prefixIcon field
            suffixIcon: suffixIcon,
            border: OutlineInputBorder( // Added OutlineInputBorder for clearer focus
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: context.colorScheme.primary.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          maxLines: maxLines ?? 1, // Default to single line if maxLines not provided
        ),
      ],
    );
  }
}
