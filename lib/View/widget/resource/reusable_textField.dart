import 'package:flutter/material.dart';

class ReusableLoginTextField extends StatefulWidget {
  final bool obscureText; // 비밀번호 가림 여부
  final String hintText; // 빈칸 시 나타나는 텍스트
  final TextEditingController controller; // 텍스트필드 값 제어

  const ReusableLoginTextField({
    Key? key,
    this.obscureText = false,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<ReusableLoginTextField> createState() => _ReusableLoginTextFieldState();
}

class _ReusableLoginTextFieldState extends State<ReusableLoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
        border: Border.all(color: Color(0xff4F60FE),width: 4.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}