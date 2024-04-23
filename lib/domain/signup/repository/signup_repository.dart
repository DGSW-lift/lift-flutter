import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:retrofit/dio.dart';
import 'package:lift/core/net/http_client.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/domain/signup/datasource/signup_datasource.dart';
import 'package:lift/domain/signup/model/interest_response.dart';

abstract class SignUpRepository {
  Future<ApiResponse> checkEmailDuplicate(String email);
  Future<ApiResponse> getFields(String word);
  Future<ApiResponse> signup(SignupRequest signupRequest, File? profile);
}

class SignUpRepositoryImpl implements SignUpRepository {
  final _dataSource = SignUpDataSource(HttpClient().client);

  @override
  Future<ApiResponse> checkEmailDuplicate(String email) async {
    ApiResponse apiResponse =
        await _dataSource.checkEmailDuplicate(email).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response != null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response != null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> getFields(String word) async {
    ApiResponse apiResponse = await _dataSource
        .getFields(word)
        .then((HttpResponse<InterestResponse> httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response != null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response != null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> signup(SignupRequest signupRequest, File? profile) async {
    ApiResponse apiResponse = await _dataSource
        .signup( profile!, signupRequest)
        .then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response != null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response != null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }


}
