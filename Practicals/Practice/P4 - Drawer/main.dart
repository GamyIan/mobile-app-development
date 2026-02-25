import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Example',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: const MyHomePage(title: 'Drawer Example'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer Example")),
      body: Center(child: Text("Just some home page.")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: AssetImage("Sample.png"),
                  //   radius: 32,
                  // ),
                  Icon(Icons.account_circle, size: 70),
                  SizedBox(height: 20),
                  Text("Hello User!"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("Home"),
              onTap: () {
                print("You Clicked on home");
                Navigator.pop(context);
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                print("You Clicked on Settings");
                Navigator.pop(context);
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                print("You Clicked on Logout");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
