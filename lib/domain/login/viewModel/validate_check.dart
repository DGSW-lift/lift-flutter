class ValidateCheck {
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return '이메일을 입력하세요.';
    }

    RegExp regExp = RegExp(emailRegex);
    if (!regExp.hasMatch(email)) {
      return '잘못된 이메일 형식입니다.';
    }

    return null; // 유효한 경우 null 반환
  }
}