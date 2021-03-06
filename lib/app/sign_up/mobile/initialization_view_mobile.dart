import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_text_field.dart';
import '../../../core/common_widgets/primary_button.dart';
import '../../../core/constants.dart';
import '../../keys.dart';
import '../sign_up_controller.dart';

class InitializationStateViewMobile extends StatelessWidget {
  final SignUpPageController controller;
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
      backgroundColor: kDarkAccentColor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: _containerWidth,
            decoration: kCardBoxDecoration,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: controller.navigateBack,
                    ),
                  ),
                  CommonTextField(
                    key: Key(WidgetKeys.signUpPageUsernameField.name),
                    textEditingController: controller.usernameTextField,
                    onChanged: controller.onTextFieldChanged,
                    title: 'Username',
                  ),
                  CommonTextField(
                    key: Key(WidgetKeys.signUpPagePasswordField.name),
                    textEditingController: controller.passwordTextField,
                    onChanged: controller.onTextFieldChanged,
                    title: 'Password',
                    obscureText: true,
                  ),
                  CommonTextField(
                    key: Key(WidgetKeys.signUpPageConfirmPasswordField.name),
                    textEditingController: controller.confirmPasswordTextField,
                    onChanged: controller.onTextFieldChanged,
                    title: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    key: Key(WidgetKeys.signUpPageRegisterButton.name),
                    title: 'Sign Up',
                    onTap: controller.signUp,
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

  bool get _isButtonDisabled {
    final bool _isEmailEmpty = controller.usernameTextField.text.trim().isEmpty;
    final bool _isPasswordsEmpty =
        controller.passwordTextField.text.trim().isEmpty ||
            controller.confirmPasswordTextField.text.trim().isEmpty;
    final bool _arePasswordsMismatched = controller.passwordTextField.text !=
        controller.confirmPasswordTextField.text.trim();

    return _isEmailEmpty || _isPasswordsEmpty || _arePasswordsMismatched;
  }
}
