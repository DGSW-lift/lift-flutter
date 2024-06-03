
import 'package:dio/dio.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/hire/model/hire_company_response.dart';
import 'package:lift/domain/hire/model/hire_detail_company.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'hire_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class HireDataSource {
  factory HireDataSource(Dio dio) = _HireDataSource;

  @GET('/hire/list')
  Future<HttpResponse<HireCompanyResponse>> list(@Query('page') int page, @Query('size') int size);

  @GET('/hire/{id}')
  Future<HttpResponse<HireDetailCompany>> getHireInfo(@Path('id') int id);

}
