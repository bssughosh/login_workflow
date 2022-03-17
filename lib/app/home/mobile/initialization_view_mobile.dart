import 'package:flutter/material.dart';

import '../mobile/loading_view_mobile.dart';
import '../home_controller.dart';

Widget buildInitializationStateViewMobile(HomePageController controller) {
  WidgetsBinding.instance!.addPostFrameCallback((_) => controller.getUser());

  return buildLoadingStateViewMobile();
}
