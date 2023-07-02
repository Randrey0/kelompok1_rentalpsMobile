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
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConsolePage()));
              },
              splashColor: Color.fromARGB(255, 11, 237, 199),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.gamepad,
                      size: 70,
                      color: Color.fromARGB(255, 212, 33, 243),
                    ),
                    Text("Data Console", style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.admin_panel_settings,
                      size: 70,
                      color: Color.fromARGB(255, 44, 1, 255),
                    ),
                    Text("Data Admin", style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MemberPage()));
              },
              splashColor: Color.fromARGB(255, 47, 142, 0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.people_alt,
                      size: 70,
                      color: Color.fromARGB(255, 0, 248, 33),
                    ),
                    Text("Data Member", style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
