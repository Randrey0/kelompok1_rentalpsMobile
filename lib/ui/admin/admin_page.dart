import 'package:flutter/material.dart';
import '../../model/admin.dart';
import 'admin_item.dart';
import 'admin_form.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Admin"),
      ),
      body: ListView(
        children: [
          AdminItem(
            admin: Admin(
                nama: "iqbale",
                alamat: "BSD",
                noTelp: "085939458",
                email: "iqbale@gmai.com"),
          ),
          AdminItem(
            admin: Admin(
                nama: "mahade",
                alamat: "CIMONE",
                noTelp: "081284307",
                email: "mahade@gmai.com"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (contex) => const AdminForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
