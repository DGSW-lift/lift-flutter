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
  Future<HttpResponse<MemberModel>> profile(@Path('id') int id);
}
