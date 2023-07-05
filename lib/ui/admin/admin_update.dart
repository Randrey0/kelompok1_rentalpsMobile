import 'package:flutter/material.dart';
import '/model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminUpdate extends StatefulWidget {
  final Admin admin;
  const AdminUpdate({Key? key, required this.admin}) : super(key: key);

  @override
  _AdminUpdateState createState() => _AdminUpdateState();
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
    _namaTextboxCtr.text = widget.admin.nama;
    _alamatTextboxCtr.text = widget.admin.alamat;
    _noTelpTextboxCtr.text = widget.admin.noTelp;
    _emailTextboxCtr.text = widget.admin.email;
  }

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
          title: const Text("Form Ubah Data Admin"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  _buildTextField(
                    label: "Nama",
                    controller: _namaTextboxCtr,
                  ),
                  _buildTextField(
                    label: "Alamat",
                    controller: _alamatTextboxCtr,
                  ),
                  _buildTextField(
                    label: "No Telpon",
                    controller: _noTelpTextboxCtr,
                  ),
                  _buildTextField(
                    label: "Email",
                    controller: _emailTextboxCtr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSimpanButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
        ),
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mohon masukkan $label';
          }
          return null;
        },
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSimpanButton() {
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
