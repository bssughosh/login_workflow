import 'package:flutter/material.dart';

import '../forgot_password_controller.dart';
import '../mobile/initialization_view_mobile.dart';

Widget buildInitializationStateViewWeb(
        ForgotPasswordPageController controller) =>
    InitializationStateViewMobile(controller: controller, isWeb: true);
