import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'desktop/error_view_web.dart';
import 'desktop/initialization_view_web.dart';
import 'desktop/loading_view_web.dart';
import 'mobile/error_view_mobile.dart';
import 'mobile/initialization_view_mobile.dart';
import 'mobile/loading_view_mobile.dart';
import 'login_controller.dart';
import 'login_state_machine.dart';

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
            return buildInitializationStateViewWeb();

          case LoginPageLoadingState:
            return buildLoadingStateViewWeb();

          case LoginPageErrorState:
            return buildErrorStateViewWeb();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get mobileView => ControlledWidgetBuilder<LoginPageController>(
          builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case LoginPageInitializationState:
            return buildInitializationStateViewMobile();

          case LoginPageLoadingState:
            return buildLoadingStateViewMobile();

          case LoginPageErrorState:
            return buildErrorStateViewMobile();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => throw UnimplementedError();
}
