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
      home: const MyHomePage(title: 'TabBar Example'),
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
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (context) => Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                DrawerHeader(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.account_circle, size: 70),
                        SizedBox(height: 15),
                        Text("Hello User!"),
                      ],
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    DefaultTabController.of(context).animateTo(0);
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Profile"),
                  onTap: () {
                    DefaultTabController.of(context).animateTo(1);
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    DefaultTabController.of(context).animateTo(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_filled), text: "Home"),
                Tab(icon: Icon(Icons.account_circle), text: "Profile"),
                Tab(icon: Icon(Icons.settings), text: "Settings"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Home Page")),
              Center(child: Text("Profile Page")),
              Center(child: Text("Settings Page")),
            ],
          ),
        ),
      ),
    );
  }
}
