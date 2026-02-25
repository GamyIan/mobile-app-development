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
      home: const MyHomePage(title: 'Form Example'),
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
  final formKey = GlobalKey<FormState>();

  late String selectedName;
  late DateTime selectedDate;

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedName = "";
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a valid name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedName = value;
                    });
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "For eg. Soul Smith",
                    label: Text("Enter Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: InputDatePickerFormField(
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  onDateSubmitted: (value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Hello $selectedName\nYou have selected the date: ${selectedDate.toString()}",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
