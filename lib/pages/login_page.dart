import 'dart:io';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final int hh = 88;

  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset('assets/images/login.png', fit: BoxFit.cover),
        const Text(
          "Welcome",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          child: Column(
            children:  [
              const TextField(
                decoration: InputDecoration(
                    labelText: "username", hintText: "username"),
              ),
              const TextField(
                  decoration: InputDecoration(
                    labelText: "password",
                    hintText: "password",
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,"/home");
                  print("Heeloo");
                },

                style: TextButton.styleFrom(),
                child: const Text("Login"),
              )
            ],
          ),
        )
      ],
    ));
    // child: Center(
    //  child: Text("Login Page"),
    // ));
  }
}
