import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('studentBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatelessWidget {
  StudentPage({super.key});

  final Box box = Hive.box('studentBox');
  final TextEditingController controller = TextEditingController();

  void addStudent() {
    if (controller.text.isNotEmpty) {
      box.add(controller.text);
      controller.clear();
    }
  }

  void updateStudent(int index, String newName) {
    box.putAt(index, newName);
  }

  void deleteStudent(int index) {
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive CRUD Example")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter Student Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: addStudent, child: const Text("Add")),
              ],
            ),
          ),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No Students"));
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(box.getAt(index)),
                      leading: Text("${index + 1}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  TextEditingController editController =
                                      TextEditingController(
                                        text: box.getAt(index),
                                      );
                                  return AlertDialog(
                                    title: const Text("Edit Student"),
                                    content: TextField(
                                      controller: editController,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          updateStudent(
                                            index,
                                            editController.text,
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Update"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit, color: Colors.blue),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
