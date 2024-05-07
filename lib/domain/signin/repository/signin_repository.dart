import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lift/core/common/models/authentication.dart';
import 'package:lift/domain/signin/datasource/signin_datasource.dart';
import 'package:lift/domain/signin/model/refresh_token_request.dart';
import 'package:lift/domain/signin/model/signin_request.dart';
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:retrofit/dio.dart';
import 'package:lift/core/net/http_client.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/domain/signup/datasource/signup_datasource.dart';
import 'package:lift/domain/signup/model/interest_response.dart';

abstract class SignInRepository {
  Future<ApiResponse> signIn(SignInRequest signInRequest);

  Future<ApiResponse> refreshToken(RefreshTokenRequest refreshTokenRequest);
}

class SignInRepositoryImpl implements SignInRepository {
  final _dataSource = SignInDataSource(HttpClient().client);

  @override
  Future<ApiResponse> signIn(SignInRequest signInRequest) async {
    ApiResponse apiResponse = await _dataSource
        .signIn(signInRequest)
        .then((HttpResponse<Authentication> httpResponse) async {
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
  Future<ApiResponse> refreshToken(RefreshTokenRequest refreshTokenRequest) async {
    ApiResponse apiResponse = await _dataSource
        .refreshToken(refreshTokenRequest)
        .then((HttpResponse<Authentication> httpResponse) async {
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
