import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'desktop/initialization_view_web.dart';
import 'desktop/loading_view_web.dart';
import 'mobile/initialization_view_mobile.dart';
import 'mobile/loading_view_mobile.dart';
import 'sign_up_controller.dart';
import 'sign_up_state_machine.dart';

class SignUpPage extends View {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState
    extends ResponsiveViewState<SignUpPage, SignUpPageController> {
  SignUpViewState() : super(SignUpPageController());

  @override
  Widget get desktopView => ControlledWidgetBuilder<SignUpPageController>(
          builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case SignUpPageInitializationState:
            return buildInitializationStateViewWeb();

          case SignUpPageLoadingState:
            return buildLoadingStateViewWeb();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get mobileView => ControlledWidgetBuilder<SignUpPageController>(
          builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case SignUpPageInitializationState:
            return buildInitializationStateViewMobile();

          case SignUpPageLoadingState:
            return buildLoadingStateViewMobile();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => throw UnimplementedError();
}
