import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          const Expanded(child: Text('LIFT', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
