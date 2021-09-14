import 'package:flutter/material.dart';
import 'homePage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      home: Container(
        child: HomePage(inputLabel: 'Nome'),
      ),
    );
  }
}
