import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';

part 'signup_datasource.g.dart';


@RestApi(baseUrl:BASE_URL)
abstract class SignUpDataSource {
  factory SignUpDataSource(Dio dio) = _SignUpDataSource;

  @GET('/auth/{email}/duplicate')
  Future<HttpResponse> checkEmailDuplicate(@Path("email") String email);

}