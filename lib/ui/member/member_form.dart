import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import '/ui/member/member_page.dart';

class MemberForm extends StatefulWidget {
  const MemberForm({Key? key}) : super(key: key);

  @override
  _MemberFormState createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final _formKey = GlobalKey<FormState>();
  final _noMemberCtrl = TextEditingController();
  final _namaMemberCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();

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
          title: const Text("Tambah Member"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _fieldNoMember(),
                  const SizedBox(height: 20),
                  _fieldNamaMember(),
                  const SizedBox(height: 20),
                  _fieldAlamat(),
                  const SizedBox(height: 20),
                  _fieldEmail(),
                  const SizedBox(height: 20),
                  _fieldNoTelp(),
                  const SizedBox(height: 20),
                  _tombolSimpan(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNoMember() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nomer Member",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _noMemberCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nomor member';
        }
        return null;
      },
    );
  }

  Widget _fieldNamaMember() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama Member",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _namaMemberCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nama member';
        }
        return null;
      },
    );
  }

  Widget _fieldAlamat() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Alamat",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _alamatCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan alamat';
        }
        return null;
      },
    );
  }

  Widget _fieldEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _emailCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan email';
        }
        return null;
      },
    );
  }

  Widget _fieldNoTelp() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nomer Telp",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _noTelpCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nomor telepon';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Member member = Member(
            noMember: _noMemberCtrl.text,
            namaMember: _namaMemberCtrl.text,
            alamat: _alamatCtrl.text,
            email: _emailCtrl.text,
            noTelp: _noTelpCtrl.text,
          );
          await MemberService().simpan(member).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MemberPage()),
            );
          });
        }
      },
      child: const Text("Simpan"),
    );
  }
}
