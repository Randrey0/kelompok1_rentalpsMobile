import 'package:flutter/material.dart';
import '/helpers/user_info.dart';
import '/ui/beranda.dart';
import '/ui/login.dart';
import '../member/member_page.dart';
import '/ui/admin/admin_page.dart';
import '/ui/console/console_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 12, 16, 17),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Selamat datang di Rental PS 🎮",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3366FF),
                      Color.fromARGB(255, 12, 16, 17)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/profile.jpg'),
                      radius: 35,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Admin",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Admin@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildListTile(
              context,
              Icons.home,
              "Beranda",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
            ),
            buildListTile(
              context,
              Icons.gamepad,
              "Console",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsolePage()),
                );
              },
            ),
            buildListTile(
              context,
              Icons.admin_panel_settings,
              "Admin",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              },
            ),
            buildListTile(
              context,
              Icons.people_alt,
              "Member",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberPage()),
                );
              },
            ),
            Divider(color: Colors.white),
            buildListTile(
              context,
              Icons.logout,
              "Keluar",
              () {
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
      ),
    );
  }

  ListTile buildListTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
