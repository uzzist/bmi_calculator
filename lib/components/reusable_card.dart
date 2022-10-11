import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color containerColor;
  final Widget? cardChild;
  final VoidCallback? onPress;

  ReusableCard({required this.containerColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: cardChild,
      ),
    );
  }
}
