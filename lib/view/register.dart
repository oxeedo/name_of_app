import 'package:flutter/material.dart';
import 'package:name_of_app/service/service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Register Page')),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              TextField(
                obscureText: false,
                decoration: InputDecoration(hintText: 'email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              InkWell(
                  onTap: () async {
                    await HttpService().registerUser(
                        {"email": email, "password": password},
                        password,
                        context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        )
        // ignore: avoid_unnecessary_containers
        );
  }
}
