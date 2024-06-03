import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final title;
  IconButton? rightIconButton;

  CustomAppBar({Key? key, this.title, this.rightIconButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (rightIconButton != null) rightIconButton!
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
