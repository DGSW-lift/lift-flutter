import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lift/domain/community/model/community_model.dart';

Future<List<CommunityModel>> fetchItems({int page = 0, int limit = 10}) async {
  final dio = Dio();
  final response = await dio.get(
    'http://localhost:8080',
    queryParameters: {'page': page, 'limit': limit},
  );

  if (response.statusCode == 200) {
    List<dynamic> body = response.data;
    return body.map((dynamic item) => CommunityModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
