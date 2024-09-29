import 'package:flutter/material.dart';
import 'package:tugas2/dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to TaskMate",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/download.jpeg', height: 200),
            const SizedBox(height: 15),
            const Text(
              "Please Login,",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
              "Enter your username and password!!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _usernameField(),
            const SizedBox(height: 5),
            _passwordField(),
            const SizedBox(height: 15),
            _loginbutton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: (value) {
          username = value;
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black)),
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.key),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black)),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _loginbutton() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            String text = "";
            if (username == "Luthfi" && password == "124220021") {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Dashboard(
                  username: username,
                );
              }));
            } else {
              text = "Login Gagal";
              SnackBar snackBar = SnackBar(content: Text(text));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text('Login', style: TextStyle(color: Colors.white)),
        ));
  }
}
