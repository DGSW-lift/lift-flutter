import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:lift/core/common/models/authentication.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/signin/model/refresh_token_request.dart';
import 'package:lift/domain/signin/model/signin_request.dart';
import 'package:lift/domain/signup/model/interest_response.dart';
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'signin_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SignInDataSource {
  factory SignInDataSource(Dio dio) = _SignInDataSource;

  @POST('/auth')
  Future<HttpResponse<Authentication>> signIn(@Body() SignInRequest signInRequest);

  @POST('/auth/refresh')
  Future<HttpResponse<Authentication>> refreshToken(@Body() RefreshTokenRequest refreshTokenRequest);

}
