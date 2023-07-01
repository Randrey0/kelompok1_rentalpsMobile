import 'package:flutter/material.dart';
import '../../model/admin.dart';
import '/ui/admin/admin_detail.dart';

class AdminItem extends StatelessWidget {
  final Admin admin;

  const AdminItem({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${admin.nama}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdminDetailWidget(admin: admin)));
      },
    );
  }
}
