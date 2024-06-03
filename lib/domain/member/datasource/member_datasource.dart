import 'package:dio/dio.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'member_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class MemberDataSource {
  factory MemberDataSource(Dio dio) = _MemberDataSource;

  @GET('/member/company/{id}/profile')
  Future<HttpResponse<MemberModel>> profileByCompanyId(@Path('id') int id);

  @GET('/member/{id}/profile')
  Future<HttpResponse<MemberModel>> profileById(@Path('id') int id);

  @GET('/member/profile')
  Future<HttpResponse<MemberModel>> profile();

  @GET('/member/email/profile')
  Future<HttpResponse<MemberModel>> profileByEmail(@Query('email') String email);
}
