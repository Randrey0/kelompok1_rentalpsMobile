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
              accountName: Text("Admin"), accountEmail: Text("Admin@mail.com")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text("Console"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConsolePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text("Admin"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Member"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MemberPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Keluar"),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
