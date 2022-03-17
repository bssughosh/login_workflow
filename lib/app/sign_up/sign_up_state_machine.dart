import '../../core/presentation/state_machine.dart';

class SignUpPageStateMachine extends StateMachine<SignUpState?, SignUpEvent> {
  SignUpPageStateMachine() : super(SignUpPageInitializationState());

  @override
  SignUpState? getStateOnEvent(SignUpEvent event) {
    SignUpState? newState;
    switch (event.runtimeType) {
      case SignUpPageLoadingEvent:
        newState = SignUpPageLoadingState();
        break;

      case SignUpPageErrorEvent:
        newState = SignUpPageInitializationState();
        break;
    }
    return newState;
  }
}

class SignUpState {}

class SignUpPageInitializationState extends SignUpState {}

class SignUpPageLoadingState extends SignUpState {}

class SignUpEvent {}

class SignUpPageLoadingEvent extends SignUpEvent {}

class SignUpPageErrorEvent extends SignUpEvent {}
