import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import '/ui/member/member_page.dart';

class MemberForm extends StatefulWidget {
  const MemberForm({Key? key}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Member"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNoMember(),
              SizedBox(height: 20),
              _fieldNamaMember(),
              SizedBox(height: 20),
              _fieldAlamat(),
              SizedBox(height: 20),
              _fieldEmail(),
              SizedBox(height: 20),
              _fieldNoTelp(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNoMember() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomer Member"),
      controller: _noMemberCtrl,
    );
  }

  _fieldNamaMember() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Member"),
      controller: _namaMemberCtrl,
    );
  }

  _fieldAlamat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
    );
  }

  _fieldEmail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
    );
  }

  _fieldNoTelp() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomer Telp"),
      controller: _noTelpCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Member member = new Member(
              noMember: _noMemberCtrl.text,
              namaMember: _namaMemberCtrl.text,
              alamat: _alamatCtrl.text,
              email: _emailCtrl.text,
              noTelp: _noTelpCtrl.text);
          await MemberService().simpan(member).then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MemberPage()));
          });
        },
        child: const Text("Simpan"));
  }
}
