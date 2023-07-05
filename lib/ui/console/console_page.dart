import 'package:flutter/material.dart';
import '/model/console.dart';
import '/service/console_service.dart';
import 'console_form.dart';
import 'console_item.dart';
import '../widget/sidebar.dart';

class ConsolePage extends StatefulWidget {
  const ConsolePage({Key? key}) : super(key: key);
  _ConsolePageState createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  Stream<List<Console>> getList() async* {
    List<Console> data = await ConsoleService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Console"),
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
        child: StreamBuilder(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Text('Data Kosong');
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ConsoleItem(console: snapshot.data[index]);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConsoleForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
