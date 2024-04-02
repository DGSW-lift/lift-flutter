import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final ButtonStyle? style;
  final double? height; 
  final TextStyle? textStyle;// Add a property for ButtonStyle

  const ReusableButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.style,
    this.height,
    this.textStyle, // Pass the style in
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: style ?? TextButton.styleFrom( 
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
