import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import '/ui/console/console_page.dart';

class ConsoleForm extends StatefulWidget {
  const ConsoleForm({Key? key}) : super(key: key);
  _ConsoleFormState createState() => _ConsoleFormState();
}

class _ConsoleFormState extends State<ConsoleForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaConsoleCtrl = TextEditingController();
  final _hargaSewaCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Console")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaConsole(),
              SizedBox(height: 20),
              _fieldHargaSewa(),
              SizedBox(height: 20),
              _fieldstok(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaConsole() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Console"),
      controller: _namaConsoleCtrl,
    );
  }

  _fieldHargaSewa() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga Sewa"),
      controller: _hargaSewaCtrl,
    );
  }

  _fieldstok() {
    return TextField(
      decoration: const InputDecoration(labelText: "Stok"),
      controller: _stokCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Console console = new Console(
              namaConsole: _namaConsoleCtrl.text,
              hargaSewa: _hargaSewaCtrl.text,
              stok: _stokCtrl.text);
          await ConsoleService().simpan(console).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ConsolePage()));
          });
        },
        child: const Text("Simpan"));
  }
}
