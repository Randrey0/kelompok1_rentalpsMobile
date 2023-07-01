import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import '/ui/console/console_update.dart';
import 'console_page.dart';

class ConsoleDetail extends StatefulWidget {
  final Console console;

  const ConsoleDetail({Key? key, required this.console}) : super(key: key);
  _ConsoleDetailState createState() => _ConsoleDetailState();
}

class _ConsoleDetailState extends State<ConsoleDetail> {
  Stream<Console> getData() async* {
    Console data = await ConsoleService().getById(widget.console.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Console")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nama Console : ${snapshot.data.namaConsole}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Harga Sewa : ${snapshot.data.hargaSewa}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Stok : ${snapshot.data.stok}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConsoleUpdateForm(console: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await ConsoleService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConsolePage()));
                          });
                        },
                        child: const Text("YA"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const Text("Hapus"));
  }
}
