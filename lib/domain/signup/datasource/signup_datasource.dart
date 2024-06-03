import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/signup/model/interest_response.dart';
import 'package:lift/domain/signup/model/signup_request.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SignUpDataSource {
  factory SignUpDataSource(Dio dio) = _SignUpDataSource;

  @GET('/auth/{email}/duplicate')
  Future<HttpResponse> checkEmailDuplicate(@Path("email") String email);

  @MultiPart()
  @POST('/auth/signup')
  @Headers(<String, dynamic>{
    'Content-Type': 'multipart/form-data',
  })
  Future<HttpResponse> signup(@Part(name: "profile") File profile,
      @Part(name: "signup") SignupRequest signup);

  @GET('/field/list')
  Future<HttpResponse<InterestResponse>> getFields(@Query("word") String word);
}
