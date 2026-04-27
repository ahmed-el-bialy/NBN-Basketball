import 'package:flutter/material.dart';

import 'Views/Main_View.dart';

void main() {
  runApp(NBNBasketball());
}

class NBNBasketball extends StatelessWidget {
  const NBNBasketball({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false, home: MainView());
  }
}
