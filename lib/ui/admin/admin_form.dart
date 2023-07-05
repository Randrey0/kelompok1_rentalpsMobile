import 'package:flutter/material.dart';
import '/model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({Key? key}) : super(key: key);

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Form Tambah Admin"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _namaTextfield(),
                  const SizedBox(height: 20),
                  _alamatTextfield(),
                  const SizedBox(height: 20),
                  _noTelpTextfield(),
                  const SizedBox(height: 20),
                  _emailTextfield(),
                  const SizedBox(height: 20),
                  _tombolSimpan(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTextfield() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _namaTextboxCtr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nama';
        }
        return null;
      },
    );
  }

  Widget _alamatTextfield() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Alamat",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _alamatTextboxCtr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan alamat';
        }
        return null;
      },
    );
  }

  Widget _noTelpTextfield() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "No Telpon",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _noTelpTextboxCtr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nomor telepon';
        }
        return null;
      },
    );
  }

  Widget _emailTextfield() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _emailTextboxCtr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan email';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_keyForm.currentState!.validate()) {
          Admin admin = Admin(
            nama: _namaTextboxCtr.text,
            alamat: _alamatTextboxCtr.text,
            noTelp: _noTelpTextboxCtr.text,
            email: _emailTextboxCtr.text,
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDetailWidget(admin: admin),
            ),
          );
        }
      },
      child: const Text("Simpan"),
    );
  }
}
