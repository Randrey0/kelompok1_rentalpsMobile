import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import '/ui/member/member_page.dart';
import 'member_detail.dart';

class MemberUpdateForm extends StatefulWidget {
  final Member member;

  const MemberUpdateForm({Key? key, required this.member}) : super(key: key);

  @override
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
          title: const Text("Ubah Data Member"),
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
            child: Column(
              children: [
                _buildTextField(
                  labelText: "Nomer Member",
                  controller: _noMemberCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Nama Member",
                  controller: _namaMemberCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Alamat",
                  controller: _alamatCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Email",
                  controller: _emailCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Nomer Telp",
                  controller: _noTelpCtrl,
                ),
                SizedBox(height: 20),
                _buildSimpanButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String labelText, required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
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
            return 'Mohon masukkan $labelText';
          }
          return null;
        },
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSimpanButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Member member = new Member(
            noMember: _noMemberCtrl.text,
            namaMember: _namaMemberCtrl.text,
            alamat: _alamatCtrl.text,
            email: _emailCtrl.text,
            noTelp: _noTelpCtrl.text,
          );
          String id = widget.member.id.toString();
          await MemberService().ubah(member, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MemberPage()),
            );
          });
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
