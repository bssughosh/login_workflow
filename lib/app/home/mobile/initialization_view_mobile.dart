import 'package:flutter/material.dart';

import '../home_controller.dart';
import '../mobile/loading_view_mobile.dart';

Widget buildInitializationStateViewMobile(HomePageController controller) {
  WidgetsBinding.instance!.addPostFrameCallback((_) => controller.getUser());

  return buildLoadingStateViewMobile();
}
