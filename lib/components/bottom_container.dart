import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class BottomContainer extends StatelessWidget {

  final String containerText;
  final VoidCallback onTap;

  BottomContainer({required this.containerText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
              containerText!,
              style: kCalculateButtonTextStyle
          ),
        ),
      ),
    );
  }
}
