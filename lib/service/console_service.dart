import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/console.dart';

class ConsoleService {
  Future<List<Console>> listData() async {
    final Response response = await ApiClient().get('console');
    print(response);
    final List data = response.data as List;
    List<Console> result = data.map((json) => Console.fromJson(json)).toList();
    return result;
  }

  Future<Console> simpan(Console console) async {
    var data = console.toJson();
    final Response response = await ApiClient().post('console', data);
    Console result = Console.fromJson(response.data);
    return result;
  }

  Future<Console> ubah(Console console, String id) async {
    var data = console.toJson();
    final Response response = await ApiClient().put('console/${id}', data);
    print(response);
    Console result = Console.fromJson(response.data);
    return result;
  }

  Future<Console> getById(String id) async {
    final Response response = await ApiClient().get('console/${id}');
    Console result = Console.fromJson(response.data);
    return result;
  }

  Future<Console> hapus(Console console) async {
    final Response response = await ApiClient().delete('console/${console.id}');
    Console result = Console.fromJson(response.data);
    return result;
  }
}
