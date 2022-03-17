import '../../core/presentation/state_machine.dart';

class HomePageStateMachine extends StateMachine<HomeState?, HomeEvent> {
  HomePageStateMachine() : super(HomePageInitializationState());

  @override
  HomeState? getStateOnEvent(HomeEvent event) {
    HomeState? newState;
    switch (event.runtimeType) {
      case HomePageInitializedEvent:
        HomePageInitializedEvent initializedEvent =
            event as HomePageInitializedEvent;
        newState = HomePageInitializedState(
          loggedInUser: initializedEvent.loggedInUser,
        );
        break;

      case HomePageLoadingEvent:
        newState = HomePageLoadingState();
        break;

      case HomePageErrorEvent:
        newState = HomePageErrorState();
        break;
    }
    return newState;
  }
}

class HomeState {}

class HomePageInitializationState extends HomeState {}

class HomePageInitializedState extends HomeState {
  final String loggedInUser;

  HomePageInitializedState({required this.loggedInUser});
}

class HomePageLoadingState extends HomeState {}

class HomePageErrorState extends HomeState {}

class HomeEvent {}

class HomePageInitializedEvent extends HomeEvent {
  final String loggedInUser;

  HomePageInitializedEvent({required this.loggedInUser});
}

class HomePageLoadingEvent extends HomeEvent {}

class HomePageErrorEvent extends HomeEvent {}
