import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import '/ui/console/console_page.dart';
import 'console_detail.dart';

class ConsoleUpdateForm extends StatefulWidget {
  final Console console;

  const ConsoleUpdateForm({Key? key, required this.console}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Console")),
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
      decoration: const InputDecoration(labelText: "Harga Sewa / Minggu"),
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
          String id = widget.console.id.toString();
          await ConsoleService().ubah(console, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ConsolePage()));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
