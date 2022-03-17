import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'desktop/initialization_view_web.dart';
import 'desktop/loading_view_web.dart';
import 'login_controller.dart';
import 'login_state_machine.dart';
import 'mobile/initialization_view_mobile.dart';
import 'mobile/loading_view_mobile.dart';

class LoginPage extends View {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState
    extends ResponsiveViewState<LoginPage, LoginPageController> {
  LoginViewState() : super(LoginPageController());

  @override
  Widget get desktopView => ControlledWidgetBuilder<LoginPageController>(
          builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case LoginPageInitializationState:
            return buildInitializationStateViewWeb(controller);

          case LoginPageLoadingState:
            return buildLoadingStateViewWeb();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get mobileView => ControlledWidgetBuilder<LoginPageController>(
          builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case LoginPageInitializationState:
            return InitializationStateViewMobile(controller: controller);

          case LoginPageLoadingState:
            return buildLoadingStateViewMobile();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => throw UnimplementedError();
}
