import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    required this.color,
    this.borderWidth,
    this.borderColor,
    this.size = 50, // Added default size for flexibility
  });
  
  final Widget? child;
  final Color color;
  final double? borderWidth;
  final Color? borderColor;
  final double size; // New size parameter for custom sizing

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: borderWidth ?? 2,
          color: borderColor ?? color, // Use borderColor if provided
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4), // Subtle shadow for 3D effect
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
