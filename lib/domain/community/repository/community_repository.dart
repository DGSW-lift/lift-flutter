import 'dart:io';

import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/net/http_client.dart';
import 'package:lift/domain/community/datasource/community_datasource.dart';
import 'package:lift/domain/community/model/search_community_request.dart';
import 'package:dio/dio.dart';

abstract class CommunityRepository {
  Future<ApiResponse>  fetchCommunity({required SearchCommunityRequest request});
  Future<ApiResponse>  communityDetail({required int id});
}

class CommunityRepositoryImpl implements CommunityRepository {

  final _dataSource = CommunityDataSource(HttpClient().client);

  @override
  Future<ApiResponse> fetchCommunity({required SearchCommunityRequest request}) async {
    ApiResponse apiResponse =
        await _dataSource.list(request.page, request.size).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> communityDetail({required int id}) async {
    ApiResponse apiResponse =
        await _dataSource.communityDetail(id).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

}