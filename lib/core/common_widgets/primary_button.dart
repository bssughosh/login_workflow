import 'package:flutter/material.dart';

import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isDisabled;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: !isDisabled,
      mouseCursor:
          isDisabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      onTap: isDisabled ? () {} : onTap,
      child: Container(
        decoration: isDisabled
            ? kPrimaryDecoration.copyWith(color: Colors.grey)
            : kPrimaryDecoration,
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: isDisabled ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
