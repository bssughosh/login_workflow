import 'package:flutter/material.dart';
import 'package:login_workflow/app/login/login_controller.dart';

import '../mobile/initialization_view_mobile.dart';

Widget buildInitializationStateViewWeb(LoginPageController controller) {
  return InitializationStateViewMobile(
    controller: controller,
    isWeb: true,
  );
}
