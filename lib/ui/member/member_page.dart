import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import 'member_form.dart';
import 'member_item.dart';
import '../widget/sidebar.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  Stream<List<Member>> getList() async* {
    List<Member> data = await MemberService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Member"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 0, 0, 0)],
          )),
        ),
      ),
      body: StreamBuilder(
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
              return MemberItem(member: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MemberForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
