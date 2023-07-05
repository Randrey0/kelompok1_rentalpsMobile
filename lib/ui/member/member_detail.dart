import 'package:flutter/material.dart';
import '/model/member.dart';
import '/service/member_service.dart';
import '/ui/member/member_update.dart';
import 'member_page.dart';

class MemberDetail extends StatefulWidget {
  final Member member;

  const MemberDetail({Key? key, required this.member}) : super(key: key);
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  Stream<Member> getData() async* {
    Member data = await MemberService().getById(widget.member.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Member"),
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
          stream: getData(),
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
              return Text('Data Tidak Ditemukan');
            }
            return Column(
              children: [
                SizedBox(height: 20),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nomer Member:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.noMember,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nama Member:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.namaMember,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Alamat:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.alamat,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.email,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nomer Telp:",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.noTelp,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_tombolUbah(), _tombolHapus()],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemberUpdateForm(member: snapshot.data),
            ),
          );
        },
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: const Text("Ubah"),
      ),
    );
  }

  Widget _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  await MemberService().hapus(snapshot.data).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MemberPage()),
                    );
                  });
                },
                child: const Text("YA"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (context) => alertDialog,
        );
      },
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
