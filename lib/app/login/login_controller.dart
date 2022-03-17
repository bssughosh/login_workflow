import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../injection.dart';
import '../navigation_service.dart';
import 'login_presenter.dart';
import 'login_state_machine.dart';

class LoginPageController extends Controller {
  final LoginPagePresenter _presenter;
  final LoginPageStateMachine _stateMachine = LoginPageStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  final TextEditingController emailTextField;
  final TextEditingController passwordTextField;
  LoginPageController()
      : _presenter = serviceLocator<LoginPagePresenter>(),
        emailTextField = TextEditingController(text: ''),
        passwordTextField = TextEditingController(text: ''),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    emailTextField.dispose();
    passwordTextField.dispose();
    super.onDisposed();
  }

  void onTextFieldChanged() {
    refreshUI();
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(NavigationService.signUpRoute);
  }

  LoginState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
