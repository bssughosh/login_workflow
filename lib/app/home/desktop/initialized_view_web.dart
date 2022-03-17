import 'package:flutter/material.dart';

import '../home_controller.dart';
import '../home_state_machine.dart';
import '../mobile/initialized_view_mobile.dart';

Widget buildInitializedStateViewWeb(
  HomePageController controller,
  HomePageInitializedState initializedState,
) =>
    buildInitializedStateViewMobile(controller, initializedState);
