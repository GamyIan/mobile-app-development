import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.tealAccent)),
      home: const MyHomePage(title: 'Steppa Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("You cannot go back")));
          }
        },
        onStepContinue: () {
          if (currentStep < 2) {
            setState(() {
              currentStep++;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You are already at the final step")),
            );
          }
        },

        steps: [
          Step(
            title: Text("Step 1"),
            content: Text("Enter personal details"),
            isActive: true,
          ),

          Step(
            title: Text("Step 2"),
            content: Text("Enter address details"),
            isActive: true,
          ),

          Step(
            title: Text("Step 3"),
            content: Text("Confirm details"),
            isActive: true,
          ),
        ],
      ),
    );
  }
}
