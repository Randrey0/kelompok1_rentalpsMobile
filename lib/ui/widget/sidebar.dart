import 'package:flutter/material.dart';
import '/helpers/user_info.dart';
import '/ui/beranda.dart';
import '/ui/login.dart';
import '../member/member_page.dart';
import '/ui/admin/admin_page.dart';
import '/ui/console/console_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("Admin@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/background.jpg'),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3366FF), Color.fromARGB(255, 12, 16, 17)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            otherAccountsPictures: [
              Text(
                "Selamat datang",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 47, 125, 233),
            leading: Icon(Icons.home),
            title: Text(
              "Beranda",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 66, 67, 68),
            leading: Icon(Icons.gamepad, color: Colors.white),
            title: Text(
              "Console",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsolePage()),
              );
            },
          ),
          ListTile(
            tileColor: Colors.orange,
            leading: Icon(Icons.admin_panel_settings, color: Colors.white),
            title: Text(
              "Admin",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPage()),
              );
            },
          ),
          ListTile(
            tileColor: Colors.green,
            leading: Icon(Icons.people_alt, color: Colors.white),
            title: Text(
              "Member",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemberPage()),
              );
            },
          ),
          ListTile(
            tileColor: Colors.red,
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text(
              "Keluar",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
