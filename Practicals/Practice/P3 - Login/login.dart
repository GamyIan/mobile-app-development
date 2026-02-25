import 'package:flutter/material.dart';
import 'package:p3_login/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final isLoggedIn = false;
  String username = "";
  String password = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (username == "admin" && password == "1234") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Logged In Sucessfully...")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("LoginFailed... \nInvalid Creditentials...")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: "Enter Email"),
                onChanged: (value) => {
                  setState(() {
                    username = value;
                  }),
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter password"),
                onChanged: (value) => {
                  setState(() {
                    password = value;
                  }),
                },
              ),
              ElevatedButton(onPressed: login, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
