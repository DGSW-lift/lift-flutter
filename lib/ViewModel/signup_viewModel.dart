import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lift/Model/signup_request.dart';

class SignUpViewModel extends ChangeNotifier {
 
  final Dio _dio = Dio();
  Future<void> signUp(SignupRequest signupRequest) async {
    String? baseURL = dotenv.env['baseURL'];
    try {
      final response = await _dio.post(
        "$baseURL+/auth/signup",
        data: signupRequest.toJson(),
      );

      if (response.statusCode == 200) {
        // 성공적으로 회원가입이 완료되었을 때
        print('회원가입 성공!');
      } else {
        // 회원가입 실패
        print('회원가입 실패: ${response.statusCode}');
      }
    } catch (e) {
      // 오류 발생
      print('오류 발생: $e');
    }
  }
}
