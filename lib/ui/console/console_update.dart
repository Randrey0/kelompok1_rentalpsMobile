import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import '/ui/console/console_page.dart';
import 'console_detail.dart';

class ConsoleUpdateForm extends StatefulWidget {
  final Console console;

  const ConsoleUpdateForm({Key? key, required this.console}) : super(key: key);

  @override
  _ConsoleUpdateFormState createState() => _ConsoleUpdateFormState();
}

class _ConsoleUpdateFormState extends State<ConsoleUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaConsoleCtrl = TextEditingController();
  final _hargaSewaCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();
  Future<Console> getData() async {
    Console data = await ConsoleService().getById(widget.console.id.toString());
    setState(() {
      _namaConsoleCtrl.text = data.namaConsole;
      _hargaSewaCtrl.text = data.hargaSewa;
      _stokCtrl.text = data.stok;
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
          title: const Text("Ubah Data Console"),
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
                  labelText: "Nama Console",
                  controller: _namaConsoleCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Harga Sewa / Minggu",
                  controller: _hargaSewaCtrl,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  labelText: "Stok",
                  controller: _stokCtrl,
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
          Console console = Console(
            namaConsole: _namaConsoleCtrl.text,
            hargaSewa: _hargaSewaCtrl.text,
            stok: _stokCtrl.text,
          );
          String id = widget.console.id.toString();
          await ConsoleService().ubah(console, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ConsolePage()),
            );
          });
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
