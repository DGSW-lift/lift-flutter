import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/common/models/authentication.dart';
import 'package:lift/core/helpers/token_storage_helper.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:lift/domain/signin/model/refresh_token_request.dart';
import 'package:lift/domain/signin/repository/signin_repository.dart';
import 'package:lift/domain/signin/view/signin_select_view.dart';

class SplashService {
  final SignInRepository _api = SignInRepositoryImpl();

  void isLogin() {
    Timer(const Duration(seconds: 1), () async {
      String? accessToken = await TokenStorage().getAccessToken();
      String? refreshToken = await TokenStorage().getRefreshToken();
      if (accessToken == null || refreshToken == null) {
        toLoginView();
        return;
      } else {
        ApiResponse apiResponse = await _api
            .refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
        if (apiResponse.statusCode == HttpStatus.ok) {
          Authentication authentication = apiResponse.data;
        // to Main
          return;
        }
        toLoginView();
        return;
      }
    });

    // Timer(const Duration(seconds: 2), () => Get.offAll(const LoginView()));
  }

  void toLoginView() {
    Get.offAll(const LoginView());
  }
}
