import 'package:flutter/material.dart';
import '../../model/member.dart';
import 'member_detail.dart';

class MemberItem extends StatelessWidget {
  final Member member;

  const MemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            member.noMember,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MemberDetail(member: member)));
      },
    );
  }
}
