import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/member.dart';

class MemberService {
  Future<List<Member>> listData() async {
    final Response response = await ApiClient().get('member');
    print(response);
    final List data = response.data as List;
    List<Member> result = data.map((json) => Member.fromJson(json)).toList();
    return result;
  }

  Future<Member> simpan(Member member) async {
    var data = member.toJson();
    final Response response = await ApiClient().post('member', data);
    Member result = Member.fromJson(response.data);
    return result;
  }

  Future<Member> ubah(Member member, String id) async {
    var data = member.toJson();
    final Response response = await ApiClient().put('member/${id}', data);
    print(response);
    Member result = Member.fromJson(response.data);
    return result;
  }

  Future<Member> getById(String id) async {
    final Response response = await ApiClient().get('member/${id}');
    Member result = Member.fromJson(response.data);
    return result;
  }

  Future<Member> hapus(Member member) async {
    final Response response = await ApiClient().delete('member/${member.id}');
    Member result = Member.fromJson(response.data);
    return result;
  }
}
