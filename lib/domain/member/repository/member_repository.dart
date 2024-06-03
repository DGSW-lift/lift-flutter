

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/net/http_client.dart';
import 'package:lift/domain/member/datasource/member_datasource.dart';

abstract class MemberRepository {
  Future<ApiResponse>  profileByCompanyId({required int id});
  Future<ApiResponse>  profileById({required int id});
  Future<ApiResponse>  profileByEmail({required  String email});
  Future<ApiResponse>  profile();
}

class MemberRepositoryImpl implements MemberRepository {

  final _dataSource = MemberDataSource(HttpClient().client);

  @override
  Future<ApiResponse> profileByCompanyId({required int id}) async {
    ApiResponse apiResponse =
        await _dataSource.profileByCompanyId(id).then((httpResponse) async {
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
  Future<ApiResponse> profileByEmail({required  String email}) async {
    ApiResponse apiResponse =
        await _dataSource.profileByEmail(email).then((httpResponse) async {
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
  Future<ApiResponse> profileById({required int id}) async {
    ApiResponse apiResponse =
        await _dataSource.profileById(id).then((httpResponse) async {
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
  Future<ApiResponse> profile() async {
    ApiResponse apiResponse =
    await _dataSource.profile().then((httpResponse) async {
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