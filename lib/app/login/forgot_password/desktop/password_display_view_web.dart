import 'package:flutter/material.dart';

import '../forgot_password_state_machine.dart';
import '../mobile/password_display_view_mobile.dart';

Widget buildPasswordDisplayStateViewWeb(
        ForgotPasswordPagePasswordDisplayState passwordDisplayState) =>
    PasswordDisplayStateViewMobile(
      isWeb: true,
      passwordDisplayState: passwordDisplayState,
    );
