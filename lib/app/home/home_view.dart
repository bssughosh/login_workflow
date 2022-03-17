import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'desktop/error_view_web.dart';
import 'desktop/initialization_view_web.dart';
import 'desktop/initialized_view_web.dart';
import 'desktop/loading_view_web.dart';
import 'mobile/error_view_mobile.dart';
import 'mobile/initialization_view_mobile.dart';
import 'mobile/initialized_view_mobile.dart';
import 'mobile/loading_view_mobile.dart';
import 'home_controller.dart';
import 'home_state_machine.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ResponsiveViewState<HomePage, HomePageController> {
  HomeViewState() : super(HomePageController());

  @override
  Widget get desktopView => ControlledWidgetBuilder<HomePageController>(
          builder: (context, controller) {
        final currentState = controller.getCurrentState();
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case HomePageInitializationState:
            return buildInitializationStateViewWeb(controller);

          case HomePageInitializedState:
            HomePageInitializedState initializedState =
                currentState as HomePageInitializedState;
            return buildInitializedStateViewWeb(controller, initializedState);

          case HomePageLoadingState:
            return buildLoadingStateViewWeb();

          case HomePageErrorState:
            return buildErrorStateViewWeb();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get mobileView => ControlledWidgetBuilder<HomePageController>(
          builder: (context, controller) {
        final currentState = controller.getCurrentState();
        final currentStateType = controller.getCurrentState().runtimeType;

        switch (currentStateType) {
          case HomePageInitializationState:
            return buildInitializationStateViewMobile(controller);

          case HomePageInitializedState:
            HomePageInitializedState initializedState =
                currentState as HomePageInitializedState;
            return buildInitializedStateViewMobile(
                controller, initializedState);

          case HomePageLoadingState:
            return buildLoadingStateViewMobile();

          case HomePageErrorState:
            return buildErrorStateViewMobile();
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      });

  @override
  Widget get tabletView => mobileView;

  @override
  Widget get watchView => throw UnimplementedError();
}
