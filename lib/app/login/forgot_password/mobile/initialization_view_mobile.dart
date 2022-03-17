import 'package:flutter/material.dart';

import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/constants.dart';
import '../../../keys.dart';
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
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _containerWidth =
        isWeb ? _screenWidth * 0.3 : _screenWidth * 0.6;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: _containerWidth,
          decoration: kCardBoxDecoration,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextField(
                  key: Key(WidgetKeys.forgotPasswordPageUsernameField.name),
                  textEditingController: controller.usernameTextField,
                  onChanged: controller.onTextFieldChanged,
                  title: 'Username',
                  smallText: true,
                ),
                PrimaryButton(
                  key: Key(
                      WidgetKeys.forgotPasswordPageSubmitUsernameButton.name),
                  title: 'Submit',
                  onTap: controller.checkIfUserExists,
                  isDisabled: controller.usernameTextField.text.trim().isEmpty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
