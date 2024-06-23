
import 'package:dio/dio.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/community/model/community_detail.dart';
import 'package:lift/domain/community/model/community_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'community_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CommunityDataSource {
  factory CommunityDataSource(Dio dio) = _CommunityDataSource;

  @GET('/board/list')
  Future<HttpResponse<CommunityResponse>> list(@Query('page') int page, @Query('size') int size);

  @GET('/board/{id}')
  Future<HttpResponse<CommunityDetail>> communityDetail(@Path("id") int id);

}
