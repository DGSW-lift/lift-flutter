
import 'dart:io';
import 'package:dio/dio.dart' ;
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/get.dart' as getx;
import 'package:lift/core/common/models/authentication.dart';
import 'package:lift/core/helpers/token_storage_helper.dart';
import 'package:lift/core/net/api_constants.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'dart:convert';

import 'package:lift/domain/signin/model/refresh_token_request.dart';

class HttpClient {
  late Dio client;
  late Dio retryClient;

  HttpClient() {
    client = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));
    client.interceptors.add(_interceptor());
    client.interceptors.add(RetryInterceptor(
      dio: client,
      retries: 1,
      retryDelays: const [
        Duration(seconds: 30),
      ],
    ));

    retryClient = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        int diffSecond = 0;
        String? accessToken = await TokenStorage().getAccessToken();
        if (accessToken == null) return;
        Map<String, dynamic>? decodedToken = decodeJwt(accessToken!);
        if (decodedToken != null && decodedToken.containsKey("exp")) {
          int expirationTimestamp = decodedToken["exp"];
          final now = DateTime.now();
          DateTime expirationDate =
              DateTime.fromMillisecondsSinceEpoch(expirationTimestamp * 1000);
          diffSecond = expirationDate.difference(now).inSeconds;
          if(diffSecond < 0){
            final refreshToken = await TokenStorage().getRefreshToken();
            if (refreshToken == null || refreshToken == "") throw Exception('');
            try {
              Response response = await retryClient.post(
                '${BASE_URL}/auth/refresh',
                data:  RefreshTokenRequest(refreshToken: refreshToken).toJson(),
              );
              if (response.statusCode == HttpStatus.ok) {
                Authentication authentication = Authentication.fromJson(response.data);
                await TokenStorage().save(authentication);
              }
            } catch (e) {
              getx.Get.to(() => const LoginView());
            }
          }
        } else {}
        accessToken = await TokenStorage().getAccessToken();
        if (accessToken != null) {
          options.headers.addAll({
            'Authorization': 'Bearer $accessToken',
          });
        }
        handler.next(options);
      },
      onError: (e, handler) async {
        // if (e.response?.statusCode == 401) {
        //   String? accessToken = await refreshToken();
        //   if (accessToken == null) return handler.next(e);
        //   e.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        //   return handler.resolve(await client.fetch(e.requestOptions));
        // }
        return handler.next(e);
      },
    );
  }

  Map<String, dynamic>? decodeJwt(String token) {
    List<String> parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    String decodedPayload =
        base64Url.normalize(parts[1]); // Normalize base64 string
    while (decodedPayload.length % 4 != 0) {
      decodedPayload += '=';
    }

    decodedPayload = utf8.decode(base64Url.decode(decodedPayload));
    return json.decode(decodedPayload);
  }
}
