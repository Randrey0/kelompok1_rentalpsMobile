import 'dart:ui';

import 'package:flutter/material.dart';
import '/ui/widget/sidebar.dart';
import '/ui/console/console_page.dart';
import '/ui/member/member_page.dart';
import '/ui/admin/admin_page.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Beranda"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
        child: GridView.count(
          padding: const EdgeInsets.all(25),
          crossAxisCount: 2,
          children: <Widget>[
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(0, 185, 121, 121),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(44, 15, 15, 15).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsolePage()),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.gamepad,
                              size: 70,
                              color: Color.fromARGB(255, 253, 190, 0),
                            ),
                            Text(
                              "Data Console",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(0, 185, 121, 121),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(44, 15, 15, 15).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminPage()),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.admin_panel_settings,
                              size: 70,
                              color: Color.fromARGB(255, 0, 177, 231),
                            ),
                            Text(
                              "Data Admin",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(0, 185, 121, 121),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(44, 15, 15, 15).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MemberPage()),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.people_alt,
                              size: 70,
                              color: Color.fromARGB(255, 0, 255, 17),
                            ),
                            Text(
                              "Data Member",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
