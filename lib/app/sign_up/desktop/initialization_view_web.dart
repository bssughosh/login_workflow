import 'package:flutter/material.dart';
import 'package:login_workflow/app/sign_up/sign_up_controller.dart';

import '../mobile/initialization_view_mobile.dart';

Widget buildInitializationStateViewWeb(SignUpPageController controller) =>
    InitializationStateViewMobile(
      controller: controller,
      isWeb: true,
    );
