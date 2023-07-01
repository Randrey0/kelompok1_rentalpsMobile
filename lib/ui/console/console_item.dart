import 'package:flutter/material.dart';
import '../../model/console.dart';
import 'console_detail.dart';

class ConsoleItem extends StatelessWidget {
  final Console console;

  const ConsoleItem({super.key, required this.console});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            console.namaConsole,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConsoleDetail(console: console)));
      },
    );
  }
}
