import 'package:flutter/material.dart';

void main() {
  runApp(const MyDrawer());
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DrawerExample());
  }
}

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MakeMyTip")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 25, 189, 66),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("onasis.webp"),
                    radius: 35,
                  ),
                  //Icon(Icons.account_circle, size: 70, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Welcome User",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                print("Home Clicked");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Profile"),
              onTap: () {
                print("Profile Clicked");
                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favourites"),
              onTap: () {
                print("Favourites Clicked");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock_clock),
              title: const Text("Recently Viewed"),
              onTap: () {
                print("Recently Viewed Clicked");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Bookings"),
              onTap: () {
                print("Bookings Clicked");
                Navigator.pop(context);
              },

            const Divider(),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Support"),
              onTap: () {
                print("Support Clicked");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                print("Settings Clicked");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                print("Log Out Clicked");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}
