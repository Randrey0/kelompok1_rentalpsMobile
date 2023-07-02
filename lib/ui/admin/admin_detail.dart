import 'package:flutter/material.dart';
import '/ui/admin/admin_update.dart';
import '../../model/admin.dart';

class AdminDetailWidget extends StatefulWidget {
  final Admin admin;

  const AdminDetailWidget({super.key, required this.admin});

  @override
  State<AdminDetailWidget> createState() => _AdminDetailWidgetState();
}

class _AdminDetailWidgetState extends State<AdminDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Admin"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
          )),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 28),
          Text(
            "Nama : ${widget.admin.nama}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 28),
          Text(
            "Alamat Lahir : ${widget.admin.alamat}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 28),
          Text(
            "Nomor Telpon : ${widget.admin.noTelp}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 28),
          Text(
            "Email : ${widget.admin.email}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminUpdate(admin: widget.admin)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Hapus"));
  }
}
