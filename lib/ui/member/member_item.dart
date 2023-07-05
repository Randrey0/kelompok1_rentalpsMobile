import 'package:flutter/material.dart';
import '../../model/member.dart';
import 'member_detail.dart';

class MemberItem extends StatelessWidget {
  final Member member;

  const MemberItem({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 34, 255, 0)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            title: Text(
              "${member.noMember} ${member.namaMember}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemberDetail(member: member)),
        );
      },
    );
  }
}
