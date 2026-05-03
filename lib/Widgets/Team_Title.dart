import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamTitle extends StatelessWidget {
  const TeamTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        color: Color(0xff1E1E1E),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 40.sp,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}