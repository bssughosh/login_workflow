import 'package:flutter/material.dart';

import '../forgot_password_controller.dart';

class InitializationStateViewMobile extends StatelessWidget {
  final bool isWeb;
  final ForgotPasswordPageController controller;

  const InitializationStateViewMobile({
    Key? key,
    this.isWeb = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
