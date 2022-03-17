import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/exceptions.dart';
import '../../core/presentation/use_case_observer.dart';
import '../../injection.dart';
import '../navigation_service.dart';
import 'login_presenter.dart';
import 'login_state_machine.dart';

class LoginPageController extends Controller {
  final LoginPagePresenter _presenter;
  final LoginPageStateMachine _stateMachine = LoginPageStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  final TextEditingController usernameTextField;
  final TextEditingController passwordTextField;
  LoginPageController()
      : _presenter = serviceLocator<LoginPagePresenter>(),
        usernameTextField = TextEditingController(text: ''),
        passwordTextField = TextEditingController(text: ''),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    usernameTextField.dispose();
    passwordTextField.dispose();
    super.onDisposed();
  }

  void onTextFieldChanged() {
    refreshUI();
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(NavigationService.signUpRoute);
  }

  void login() {
    _stateMachine.onEvent(LoginPageLoadingEvent());
    refreshUI();

    final String username = usernameTextField.text;
    final String password = passwordTextField.text;

    _presenter.login(
      UseCaseObserver(() {
        _navigationService.navigateTo(
          NavigationService.homeRoute,
          shouldReplace: true,
        );
      }, _handleErrorStates),
      username: username,
      password: password,
    );
  }

  void _handleErrorStates(error) {
    _stateMachine.onEvent(LoginPageErrorEvent());
    refreshUI();

    if (error is UserNotRegisteredException) {
      usernameTextField.text = '';
      passwordTextField.text = '';
      Fluttertoast.showToast(
        msg: 'Please register first',
        timeInSecForIosWeb: 4,
      );
    } else if (error is UsernamePasswordMismatchException) {
      passwordTextField.text = '';
      Fluttertoast.showToast(
        msg: 'Username and password are not matching',
        timeInSecForIosWeb: 4,
      );
    }
  }

  LoginState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
