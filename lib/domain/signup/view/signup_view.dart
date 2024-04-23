import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lift/View/widget/resource/reusable_checkBox.dart';
import 'package:get/get.dart';
import 'package:lift/domain/signup/view/widget/signup/input_email_widget.dart';
import 'package:lift/domain/signup/view/widget/signup/signup_button_widget.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignInScreenState();

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  }
}

class _SignInScreenState extends State<SignUpView> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(surfaceTintColor: Colors.white,),
      body: Column(
        children: [
          _signUpText(),
          const SizedBox(height: 30),
          Form(key: _formkey, child: _emailTextField()),
          const SizedBox(height: 10),
          SignUpButtonWidget(formKey: _formkey),
          // _nextButton(context),
          const SizedBox(height: 10),
          _orText(),
          const SizedBox(height: 12),
          const SocialLoginButton(),
          const SizedBox(height: 20),
          const TermOfUseTextarea(),
        ],
      ),
    );
  }
}

Widget _signUpText() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("회원 가입",
            style: TextStyle(

                fontWeight: FontWeight.bold,
                fontFamily: 'NanumGothicBold',
                fontSize: 40),

            textAlign: TextAlign.left),
        SizedBox(
          height: 20,
        ),
        Opacity(
            opacity: 0.2,
            child: Text("만 14세 미만은 가입할 수 없습니다.",

            style: TextStyle(fontFamily: 'NanumGothic', fontSize: 15),
            textAlign: TextAlign.left)),

      ],
    ),
  );
}

Widget _emailTextField() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이메일',
          style: TextStyle(fontSize: 15, color: Color(0xff9B9B9B)),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 2,
        ),
        InputEmailWidget()
      ],
    ),
  );
}
// Widget _nextButton(BuildContext context) {
//   return Container(
//     width: double.infinity,
//     height: 49,
//     padding: const EdgeInsets.only(left: 18, right: 18),
//     child: ReusableButton(
//       onPressed: () {
//         Get.to(() => const EnterNameScreen());
//       },
//       style: TextButton.styleFrom(
//         backgroundColor: const Color(0xff4F60FE),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           ),
//         ),
//       ),
//       text: '다음',
//       textStyle: const TextStyle(color: Colors.white),
//     ),
//   );
// }

Widget _orText() {
  return const Text(
    '또는',
    style: TextStyle(
        fontSize: 12, fontFamily: 'NanumGothicBold', color: Color(0xff898989)),
  );
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (GetPlatform.isIOS) ...[
          Ink.image(
            image: const AssetImage('assets/images/Login_apple.png'),
            height: 45,
            width: 45,
            child: InkWell(
              onTap: () async {
                appleLogin();
              },
            ),
          ),
          const SizedBox(height: 50, width: 10),
        ],
        Ink.image(
          image: const AssetImage('assets/images/Login_google.png'),
          height: 45,
          width: 45,
          child: InkWell(
            onTap: () async {
              final GoogleSignInAccount? googleUser =
                  await GoogleSignIn().signIn();
            },
          ),
        ),
      ],
    );
  }
}

class TermOfUseTextarea extends StatefulWidget {
  const TermOfUseTextarea({super.key});

// 약관 동의 위젯
// 수정사항: 체크박스 클릭 이벤트 넣기
  @override
  State<TermOfUseTextarea> createState() => _TermOfUseTextareaState();
}

class _TermOfUseTextareaState extends State<TermOfUseTextarea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '서비스 약관 동의',
            style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ReuseableCheckbox(),
              SizedBox(width: 15),
              Text('이용약관 동의'),
              Spacer(),
              TextButton(
                  onPressed: null,
                  child: Text(
                    '보기',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ))
            ],
          ),
          Row(
            children: [
              ReuseableCheckbox(),
              SizedBox(width: 15),
              Text('개인정보취급방침 동의'),
              Spacer(),
              TextButton(
                  onPressed: null,
                  child: Text(
                    '보기',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> appleLogin() async {
  // 1. 애플 로그인이 이용 가능한지 체크함.
  if (await TheAppleSignIn.isAvailable()) {
    final AuthorizationResult result = await TheAppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        break;

      case AuthorizationStatus.error:
        print('애플 로그인 오류 : ${result.error!.localizedDescription}');
        break;

      case AuthorizationStatus.cancelled:
        print("로그인을 취소하였습니다");
        break;
    }
  } else {
    print('애플 로그인을 지원하지 않는 기기입니다.');
  }
}
