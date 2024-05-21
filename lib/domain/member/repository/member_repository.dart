

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/net/http_client.dart';
import 'package:lift/domain/member/datasource/member_datasource.dart';

abstract class MemberRepository {
  Future<ApiResponse>  profile({required int id});
}

class MemberRepositoryImpl implements MemberRepository {

  final _dataSource = MemberDataSource(HttpClient().client);

  @override
  Future<ApiResponse> profile({required int id}) async {
    ApiResponse apiResponse =
        await _dataSource.profile(id).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }


}