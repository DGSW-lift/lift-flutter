// custom_appbar.dart 
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // 플러터 기본 앱바 제거
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Image(
              image: AssetImage('assets/images/BackButton.png'),
              height: 22,
              width: 12),
          onPressed: () {
              Navigator.of(context).pop();
            },
        ),
        const Spacer(),// '다음'버튼이 오른쪽에 붙을때까지 여백 주기
         TextButton(
            onPressed: () {},
            child: const Text(
              '다음',
              style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 13,
                  color: Color(0xff4F60FE)),
            ),
          ),
      ],
    ),
  );
}