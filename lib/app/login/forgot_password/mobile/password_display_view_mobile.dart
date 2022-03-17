import 'package:flutter/material.dart';

import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/constants.dart';
import '../forgot_password_state_machine.dart';

class PasswordDisplayStateViewMobile extends StatelessWidget {
  final ForgotPasswordPagePasswordDisplayState passwordDisplayState;
  final bool isWeb;

  const PasswordDisplayStateViewMobile({
    Key? key,
    this.isWeb = false,
    required this.passwordDisplayState,
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
                const Text(
                  'Password is:',
                  style: kHeadingTextStyle,
                ),
                Text(passwordDisplayState.password),
                const SizedBox(height: 15),
                PrimaryButton(
                  title: 'Done',
                  onTap: Navigator.of(context).pop,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
