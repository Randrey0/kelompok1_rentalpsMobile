import 'package:flutter/material.dart';
import '/model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminUpdate extends StatefulWidget {
  final Admin admin;
  const AdminUpdate({super.key, required this.admin});

  @override
  State<AdminUpdate> createState() => _AdminUpdateState();
}

class _AdminUpdateState extends State<AdminUpdate> {
  final _keyForm = GlobalKey<FormState>();
  final _namaTextboxCtr = TextEditingController();
  final _alamatTextboxCtr = TextEditingController();
  final _noTelpTextboxCtr = TextEditingController();
  final _emailTextboxCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaTextboxCtr.text = widget.admin.nama;
      _alamatTextboxCtr.text = widget.admin.alamat;
      _noTelpTextboxCtr.text = widget.admin.noTelp;
      _emailTextboxCtr.text = widget.admin.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Update Admin"),
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
