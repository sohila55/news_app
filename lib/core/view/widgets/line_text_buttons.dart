import 'package:flutter/material.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

class LineTextButtons extends StatelessWidget {
  const LineTextButtons({
    super.key,
    required this.left_title,
    required this.right_title,
  });

  final String left_title;
  final String right_title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left_title,
          style: TextStyle(
            color: AppDarkColors.whiteColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          right_title,
          style: TextStyle(
            color: AppDarkColors.orangeColor,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
