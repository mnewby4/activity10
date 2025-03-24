import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success Screen')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "\nWelcome!\n", 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
            ),
          ],
        ),
      ),
    );
  }
}