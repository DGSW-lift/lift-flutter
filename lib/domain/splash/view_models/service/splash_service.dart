import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:lift/core/common/models/api_response.dart';
import 'package:lift/core/common/service/member_profile_service.dart';
import 'package:lift/core/helpers/token_storage_helper.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:lift/domain/main/view/main_view.dart';
import 'package:lift/domain/member/model/member_model.dart';
import 'package:lift/domain/member/repository/member_repository.dart';


class SplashService {
  // final SignInRepository _api = SignInRepositoryImpl();
  final MemberRepository _api = MemberRepositoryImpl();

  void isLogin() {
    Timer(const Duration(seconds: 1), () async {
      String? accessToken = await TokenStorage().getAccessToken();
      String? refreshToken = await TokenStorage().getRefreshToken();
      if (accessToken == null || refreshToken == null) {
        toLoginView();
        return;
      } else {
        ApiResponse apiResponse = await _api.profile();
        if (apiResponse.statusCode == HttpStatus.ok) {
          MemberModel memberModel = apiResponse.data;
          Get.put(MemberProfileService(memberModel));
          toMainView();
          return;
        }

        toLoginView();
        return;
      }
    });

    // Timer(const Duration(seconds: 2), () => Get.offAll(const LoginView()));
  }

  void toLoginView() {
    Get.offAll(() => const LoginView());
  }

  void toMainView() {
    Get.offAll(() => const MainView());
  }
}
