import 'package:flutter/material.dart';
import '../../model/console.dart';
import 'console_detail.dart';

class ConsoleItem extends StatelessWidget {
  final Console console;

  const ConsoleItem({Key? key, required this.console}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 61, 62, 62),
                Color.fromARGB(255, 230, 238, 0)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            title: Text(
              "🎮 ${console.namaConsole} | Stok : ${console.stok} | Harga : Rp.${console.hargaSewa} ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConsoleDetail(console: console)),
        );
      },
    );
  }
}
