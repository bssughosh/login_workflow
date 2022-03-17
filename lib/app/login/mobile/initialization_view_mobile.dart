import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_text_field.dart';
import '../../../core/common_widgets/primary_button.dart';
import '../../../core/constants.dart';
import '../login_controller.dart';

class InitializationStateViewMobile extends StatelessWidget {
  final LoginPageController controller;
  final bool isWeb;

  const InitializationStateViewMobile({
    Key? key,
    required this.controller,
    this.isWeb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _containerWidth = isWeb ? _screenWidth * 0.5 : double.infinity;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _containerWidth,
          decoration: kCardBoxDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonTextField(
                    textEditingController: controller.usernameTextField,
                    onChanged: controller.onTextFieldChanged,
                    title: 'Username',
                  ),
                  CommonTextField(
                    textEditingController: controller.passwordTextField,
                    onChanged: controller.onTextFieldChanged,
                    title: 'Password',
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    title: 'Login',
                    onTap: controller.login,
                    isDisabled: _isButtonDisabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get _isButtonDisabled =>
      controller.usernameTextField.text.isEmpty ||
      controller.passwordTextField.text.isEmpty;
}
