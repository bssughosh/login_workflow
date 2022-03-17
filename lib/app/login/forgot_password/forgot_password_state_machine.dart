import '../../../core/presentation/state_machine.dart';

class ForgotPasswordPageStateMachine
    extends StateMachine<ForgotPasswordState?, ForgotPasswordEvent> {
  ForgotPasswordPageStateMachine()
      : super(ForgotPasswordPageInitializationState());

  @override
  ForgotPasswordState? getStateOnEvent(ForgotPasswordEvent event) {
    ForgotPasswordState? newState;
    switch (event.runtimeType) {
      case ForgotPasswordPageLoadingEvent:
        newState = ForgotPasswordPageLoadingState();
        break;

      case ForgotPasswordPageErrorEvent:
        newState = ForgotPasswordPageInitializationState();
        break;

      case ForgotPasswordPagePasswordDisplayEvent:
        ForgotPasswordPagePasswordDisplayEvent passwordDisplayEvent =
            event as ForgotPasswordPagePasswordDisplayEvent;
        newState = ForgotPasswordPagePasswordDisplayState(
          password: passwordDisplayEvent.password,
        );
        break;
    }
    return newState;
  }
}

class ForgotPasswordState {}

class ForgotPasswordPageInitializationState extends ForgotPasswordState {}

class ForgotPasswordPagePasswordDisplayState extends ForgotPasswordState {
  final String password;

  ForgotPasswordPagePasswordDisplayState({required this.password});
}

class ForgotPasswordPageLoadingState extends ForgotPasswordState {}

class ForgotPasswordEvent {}

class ForgotPasswordPageLoadingEvent extends ForgotPasswordEvent {}

class ForgotPasswordPagePasswordDisplayEvent extends ForgotPasswordEvent {
  final String password;

  ForgotPasswordPagePasswordDisplayEvent({required this.password});
}

class ForgotPasswordPageErrorEvent extends ForgotPasswordEvent {}
