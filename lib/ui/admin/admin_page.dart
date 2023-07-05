import 'package:flutter/material.dart';
import '../../model/admin.dart';
import 'admin_item.dart';
import 'admin_form.dart';
import '../widget/sidebar.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Admin"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            AdminItem(
              admin: Admin(
                nama: "iqbale",
                alamat: "BSD",
                noTelp: "085939458",
                email: "iqbale@gmai.com",
              ),
            ),
            AdminItem(
              admin: Admin(
                nama: "mahade",
                alamat: "CIMONE",
                noTelp: "081284307",
                email: "mahade@gmai.com",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contex) => const AdminForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
