import 'package:flutter/material.dart';

import '../constants.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function() onChanged;
  final TextInputType textInputType;
  final bool obscureText;
  final String title;
  final bool smallText;

  const CommonTextField({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
    required this.title,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.smallText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: kHeadingTextStyle.copyWith(fontSize: smallText ? 16 : 25)),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: TextFormField(
              controller: textEditingController,
              onChanged: (_) => onChanged(),
              obscureText: obscureText,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: title,
                contentPadding: const EdgeInsets.all(10.0),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
