import 'package:allfreezed/models/github_model.dart';
import 'package:dio/dio.dart';


class GithubConnections{
   Future<Github> fetchWeather(String user) async {
  final Dio dio = Dio();

 


    try {
      final response = await dio.get(
        'https://api.github.com/users/$user',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print('JSON body: ${response.data}');
        return Github.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        print('Error body: ${response.data}');
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to make the request');
    }
  }
}


