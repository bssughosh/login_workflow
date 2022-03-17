import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/exceptions.dart';
import '../../core/presentation/use_case_observer.dart';
import '../../injection.dart';
import '../navigation_service.dart';
import 'sign_up_presenter.dart';
import 'sign_up_state_machine.dart';

class SignUpPageController extends Controller {
  final SignUpPagePresenter _presenter;
  final SignUpPageStateMachine _stateMachine = SignUpPageStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  final TextEditingController usernameTextField;
  final TextEditingController passwordTextField;
  final TextEditingController confirmPasswordTextField;
  SignUpPageController()
      : _presenter = serviceLocator<SignUpPagePresenter>(),
        usernameTextField = TextEditingController(text: ''),
        passwordTextField = TextEditingController(text: ''),
        confirmPasswordTextField = TextEditingController(text: ''),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    usernameTextField.dispose();
    passwordTextField.dispose();
    confirmPasswordTextField.dispose();
    super.onDisposed();
  }

  void navigateBack() => _navigationService.navigateBack();

  void onTextFieldChanged() {
    refreshUI();
  }

  void signUp() {
    _stateMachine.onEvent(SignUpPageLoadingEvent());
    refreshUI();

    final String username = usernameTextField.text;
    final String password = passwordTextField.text;

    _presenter.signUp(
      UseCaseObserver(() {
        _navigationService.navigateBack();
      }, _handleErrorStates),
      username: username,
      password: password,
    );
  }

  void _handleErrorStates(error) {
    _stateMachine.onEvent(SignUpPageErrorEvent());
    refreshUI();

    if (error is UserAlreadyRegisteredException) {
      Fluttertoast.showToast(
        msg:
            'This username is already registered. Please pick a different username',
        timeInSecForIosWeb: 4,
      );
    }
  }

  SignUpState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
