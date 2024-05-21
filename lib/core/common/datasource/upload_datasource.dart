import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lift/core/common/models/upload_response.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'upload_datasource.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UploadDataSource {
  factory UploadDataSource(Dio dio) = _UploadDataSource;

  @MultiPart()
  @POST('/upload/message/image')
  Future<HttpResponse<UploadResponse>> upload(@Part(name: "image") File image);
}
