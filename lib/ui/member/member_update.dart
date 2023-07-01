import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import '/ui/member/member_page.dart';
import 'member_detail.dart';

class MemberUpdateForm extends StatefulWidget {
  final Member member;

  const MemberUpdateForm({Key? key, required this.member}) : super(key: key);
  _MemberUpdateFormState createState() => _MemberUpdateFormState();
}

class _MemberUpdateFormState extends State<MemberUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _noMemberCtrl = TextEditingController();
  final _namaMemberCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  Future<Member> getData() async {
    Member data = await MemberService().getById(widget.member.id.toString());
    setState(() {
      _noMemberCtrl.text = data.noMember;
      _namaMemberCtrl.text = data.namaMember;
      _alamatCtrl.text = data.alamat;
      _emailCtrl.text = data.email;
      _noTelpCtrl.text = data.noTelp;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Member")),
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
          String id = widget.member.id.toString();
          await MemberService().ubah(member, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MemberPage()));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
