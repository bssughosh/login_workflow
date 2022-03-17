import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'desktop/error_view_web.dart';
import 'desktop/initialization_view_web.dart';
import 'desktop/loading_view_web.dart';
import 'mobile/error_view_mobile.dart';
import 'mobile/initialization_view_mobile.dart';
import 'mobile/loading_view_mobile.dart';
import 'forgot_password_controller.dart';
import 'forgot_password_state_machine.dart';

class ForgotPasswordPage extends View {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ForgotPasswordViewState();
}

class ForgotPasswordViewState extends ResponsiveViewState<ForgotPasswordPage,
    ForgotPasswordPageController> {
  ForgotPasswordViewState() : super(ForgotPasswordPageController());

  @override
  Widget get desktopView =>
      ControlledWidgetBuilder<ForgotPasswordPageController>(
          builder: (context, controller) {
        final currentState = controller.getCurrentState();
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case ForgotPasswordPageInitializationState:
            return buildInitializationStateViewWeb();

          case ForgotPasswordPageLoadingState:
            return buildLoadingStateViewWeb();

          case ForgotPasswordPageErrorState:
            return buildErrorStateViewWeb();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get mobileView =>
      ControlledWidgetBuilder<ForgotPasswordPageController>(
          builder: (context, controller) {
        final currentState = controller.getCurrentState();
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case ForgotPasswordPageInitializationState:
            return buildInitializationStateViewMobile();

          case ForgotPasswordPageLoadingState:
            return buildLoadingStateViewMobile();

          case ForgotPasswordPageErrorState:
            return buildErrorStateViewMobile();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => throw UnimplementedError();
}