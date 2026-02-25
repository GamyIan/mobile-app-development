import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isShown = false;
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _opacity = Tween(begin: 0.0, end: 1.0).animate(curved);
    _scale = Tween(begin: 0.5, end: 1.0).animate(curved);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    if (isShown) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    setState(() {
      isShown = !isShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animation Example")),
        body: Center(
          child: Column(
            children: [
              FadeTransition(
                opacity: _opacity,

                child: ScaleTransition(
                  scale: _scale,
                  child: Text(
                    "Mr. Stark I don't feel so good...",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: toggle,
                child: Text(
                  "Press to Animate",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
