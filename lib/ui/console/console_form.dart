import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import '/ui/console/console_page.dart';

class ConsoleForm extends StatefulWidget {
  const ConsoleForm({Key? key}) : super(key: key);

  @override
  _ConsoleFormState createState() => _ConsoleFormState();
}

class _ConsoleFormState extends State<ConsoleForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaConsoleCtrl = TextEditingController();
  final _hargaSewaCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();

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
          title: const Text("Tambah Console"),
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
                  _fieldNamaConsole(),
                  const SizedBox(height: 20),
                  _fieldHargaSewa(),
                  const SizedBox(height: 20),
                  _fieldstok(),
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

  Widget _fieldNamaConsole() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama Console",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _namaConsoleCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan nama console';
        }
        return null;
      },
    );
  }

  Widget _fieldHargaSewa() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Harga Sewa / Minggu",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _hargaSewaCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan harga sewa';
        }
        return null;
      },
    );
  }

  Widget _fieldstok() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Stok",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _stokCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon masukkan stok';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Console console = Console(
            namaConsole: _namaConsoleCtrl.text,
            hargaSewa: _hargaSewaCtrl.text,
            stok: _stokCtrl.text,
          );

          ConsoleService().simpan(console).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ConsolePage(),
              ),
            );
          });
        }
      },
      child: const Text("Simpan"),
    );
  }
}
