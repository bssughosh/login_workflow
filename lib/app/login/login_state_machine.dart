import '../../core/presentation/state_machine.dart';

class LoginPageStateMachine extends StateMachine<LoginState?, LoginEvent> {
  LoginPageStateMachine() : super(LoginPageInitializationState());

  @override
  LoginState? getStateOnEvent(LoginEvent event) {
    LoginState? newState;
    switch (event.runtimeType) {
      case LoginPageLoadingEvent:
        newState = LoginPageLoadingState();
        break;

      case LoginPageErrorEvent:
        newState = LoginPageInitializationState();
        break;
    }
    return newState;
  }
}

class LoginState {}

class LoginPageInitializationState extends LoginState {}

class LoginPageLoadingState extends LoginState {}

class LoginEvent {}

class LoginPageLoadingEvent extends LoginEvent {}

class LoginPageErrorEvent extends LoginEvent {}
