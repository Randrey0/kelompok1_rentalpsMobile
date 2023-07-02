import 'package:flutter/material.dart';
import '/model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({super.key});

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  final _keyForm = GlobalKey<FormState>();
  final _namaTextboxCtr = TextEditingController();
  final _alamatTextboxCtr = TextEditingController();
  final _noTelpTextboxCtr = TextEditingController();
  final _emailTextboxCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Tambah Admin"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
            )),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    _namaTextfield(),
                    _alamatTextfield(),
                    _noTelpTextfield(),
                    _emailTextfield(),
                    const SizedBox(
                      height: 20,
                    ),
                    _tombolSimpan()
                  ],
                ),
              ),
            )));
  }

  _namaTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama"),
      controller: _namaTextboxCtr,
    );
  }

  _alamatTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Alamat"),
      controller: _alamatTextboxCtr,
    );
  }

  _noTelpTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "No Telpon"),
      controller: _noTelpTextboxCtr,
    );
  }

  _emailTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: "Email"),
      controller: _emailTextboxCtr,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Admin admin = Admin(
              nama: _namaTextboxCtr.text,
              alamat: _alamatTextboxCtr.text,
              noTelp: _noTelpTextboxCtr.text,
              email: _emailTextboxCtr.text);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminDetailWidget(admin: admin)));
        },
        child: const Text("Simpan"));
  }
}
