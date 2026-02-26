import 'package:flutter/material.dart';
import 'package:p3_login/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? username;
  String? password;

  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    username = "";
    password = "";
    super.initState();
  }

  void login() {
    setState(() {
      isLoading = true;
    });
    if (username == "admin" && password == "1234") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sucessfully logged in!")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid Credentials")));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login Page"),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .center,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                controller: userController,
                decoration: InputDecoration(
                  label: Text("Enter Username"),
                  hintText: "sampleusername",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  label: Text("Enter Password"),
                  hintText: "password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
