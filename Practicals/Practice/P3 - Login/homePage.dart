import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home Page"),
      ),

      body: Center(
        child: Text(
          "Just some sample homepage...",
          style: TextStyle(fontSize: 50, fontWeight: .bold),
        ),
      ),
    );
  }
}
