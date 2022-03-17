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
    }
    return newState;
  }
}

class ForgotPasswordState {}

class ForgotPasswordPageInitializationState extends ForgotPasswordState {}

class ForgotPasswordPageLoadingState extends ForgotPasswordState {}

class ForgotPasswordEvent {}

class ForgotPasswordPageLoadingEvent extends ForgotPasswordEvent {}

class ForgotPasswordPageErrorEvent extends ForgotPasswordEvent {}
