import 'package:flutter/material.dart';

import '../constants.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isDisabled;

  const SecondaryButton({
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
            ? kSecondaryDecoration.copyWith(color: Colors.grey)
            : kSecondaryDecoration,
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
