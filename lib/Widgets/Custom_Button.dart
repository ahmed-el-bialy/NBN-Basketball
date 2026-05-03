import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.label,

  });

  final VoidCallback onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white.withValues(alpha: 0.3),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}