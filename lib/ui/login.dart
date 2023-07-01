import 'package:flutter/material.dart';
import '/service/login_service.dart';
import '/ui/beranda.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Rental PS 🎮",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 17, 255, 0)),
                ),
                const SizedBox(
                  height: 45,
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          _passwordTextField(),
                          _tombolLogin()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      style: TextStyle(color: Color.fromARGB(255, 246, 7, 7)),
      decoration: InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      style: TextStyle(color: Color.fromARGB(255, 246, 7, 7)),
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
            icon: icon),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
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
                      )
                    ],
                  );
                  showDialog(
                      context: context, builder: (context) => alertDialog);
                }
              });
            }));
  }
}
