import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/domain/hire/datasource/hire_datasource.dart';
import 'package:lift/domain/hire/model/search_hire_request.dart';
import 'package:lift/core/net/http_client.dart';

abstract class HireRepository {
  Future<ApiResponse>  fetchHires({required SearchHireRequest request});
  Future<ApiResponse>  getHireInfo({required int id});
}
class HireRepositoryImpl implements HireRepository {

  final _dataSource = HireDataSource(HttpClient().client);

  @override
  Future<ApiResponse> fetchHires({required SearchHireRequest request}) async {
    ApiResponse apiResponse =
    await _dataSource.list(request.page, request.size).then((httpResponse) async {
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

  @override
  Future<ApiResponse> getHireInfo({required int id}) async {
    ApiResponse apiResponse =
        await _dataSource.getHireInfo(id).then((httpResponse) async {
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