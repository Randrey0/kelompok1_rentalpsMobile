import 'dart:ui';

import 'package:flutter/material.dart';
import '/service/login_service.dart';
import '/ui/beranda.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Icon icon = Icon(Icons.visibility);
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Login ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: 'Rental ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: 'PS ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: '🎮',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              _usernameTextField(),
                              _passwordTextField(),
                              _tombolLogin(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: "Enter Password",
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              if (obscure == true) {
                obscure = false;
                icon = Icon(Icons.visibility_off);
              } else {
                obscure = true;
                icon = Icon(Icons.visibility);
              }
            });
          },
          icon: icon,
        ),
      ),
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Login 🎮"),
        onPressed: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          await LoginService().login(username, password).then((value) {
            if (value == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text("Username atau Password Tidak Valid"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (context) => alertDialog,
              );
            }
          });
        },
      ),
    );
  }
}
