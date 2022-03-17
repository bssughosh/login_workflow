import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../home_controller.dart';
import '../home_state_machine.dart';

Widget buildInitializedStateViewMobile(
  HomePageController controller,
  HomePageInitializedState initializedState,
) {
  return Scaffold(
    backgroundColor: kDarkAccentColor,
    appBar: AppBar(
      actions: [
        IconButton(
          onPressed: controller.logoutUser,
          icon: const Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
      ],
    ),
    body: SafeArea(
      child: Center(
        child: Text(
          'Welcome ${initializedState.loggedInUser}!',
          style: kHeadingTextStyle.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
