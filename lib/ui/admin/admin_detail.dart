import 'package:flutter/material.dart';
import '/ui/admin/admin_update.dart';
import '../../model/admin.dart';

class AdminDetailWidget extends StatefulWidget {
  final Admin admin;

  const AdminDetailWidget({Key? key, required this.admin}) : super(key: key);

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
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 28),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nama :",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.admin.nama,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Alamat Lahir :",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.admin.alamat,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nomor Telpon :",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.admin.noTelp,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Email :",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.admin.email,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_tombolUbah(), _tombolHapus()],
            )
          ],
        ),
      ),
    );
  }

  Widget _tombolUbah() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminUpdate(admin: widget.admin),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  Widget _tombolHapus() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
