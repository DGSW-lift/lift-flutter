import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lift/core/common/datasource/upload_datasource.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/net/http_client.dart';

abstract class UploadRepository {
  Future<ApiResponse> upload({required File file});
}

class UploadRepositoryImpl implements UploadRepository {

  final _uploadDatasource = UploadDataSource(HttpClient().client);

  @override
  Future<ApiResponse> upload({required File file}) async {
    ApiResponse apiResponse =
    await _uploadDatasource.upload(file).then((httpResponse) async {
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
