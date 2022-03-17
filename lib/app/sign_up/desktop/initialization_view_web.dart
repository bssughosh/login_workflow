import 'package:flutter/material.dart';

import '../mobile/initialization_view_mobile.dart';
import '../sign_up_controller.dart';

Widget buildInitializationStateViewWeb(SignUpPageController controller) =>
    InitializationStateViewMobile(
      controller: controller,
      isWeb: true,
    );
