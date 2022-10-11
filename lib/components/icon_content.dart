import 'package:flutter/cupertino.dart';
import 'package:bmi_calculator/utils/constants.dart';

class IconContent extends StatelessWidget {

  final IconData? fontIcon;
  final String? iconText;

  IconContent({this.fontIcon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(iconText!,
            style: kLabelTextStyle
        )
      ],
    );
  }
}
