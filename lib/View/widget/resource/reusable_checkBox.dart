import 'package:flutter/material.dart';

class ReuseableCheckbox extends StatelessWidget {
  const ReuseableCheckbox({
    Key? key,
    this.value = false,
    this.onChanged,
    this.borderRadius = 4.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
