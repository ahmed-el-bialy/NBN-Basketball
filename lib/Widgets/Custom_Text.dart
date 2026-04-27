import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.lastPoint,
    required this.teamName,
  });

  final int lastPoint;
  final String? teamName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 28),
                children: [
                  TextSpan(
                    text: "Last : ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: lastPoint != 0 ? "+$lastPoint " : "- ",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: lastPoint != 0 ? "pts " : "- ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: lastPoint != 0 ? teamName : "- ",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
