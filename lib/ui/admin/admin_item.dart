import 'package:flutter/material.dart';
import '../../model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminItem extends StatelessWidget {
  final Admin admin;

  const AdminItem({Key? key, required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 6, 6, 6),
                Color.fromARGB(255, 1, 215, 244)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            title: Text(
              "${admin.nama}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AdminDetailWidget(admin: admin)),
        );
      },
    );
  }
}
