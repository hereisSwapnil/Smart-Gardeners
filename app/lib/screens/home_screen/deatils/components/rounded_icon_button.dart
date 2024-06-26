import 'package:flutter/material.dart';
import 'package:sg_android/utils/constants.dart';

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({
    Key? key,
    required this.iconData,
    this.color = kPrimaryColor,
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      onPressed: press,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
