import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: const Row(
        children: [
          Expanded(child: Text('채팅', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),)
        ],
      ),
    );
  }
}
