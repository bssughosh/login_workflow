import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/presentation/use_case_observer.dart';
import '../../../injection.dart';
import 'forgot_password_presenter.dart';
import 'forgot_password_state_machine.dart';

class ForgotPasswordPageController extends Controller {
  final ForgotPasswordPagePresenter _presenter;
  final ForgotPasswordPageStateMachine _stateMachine =
      ForgotPasswordPageStateMachine();
  final TextEditingController usernameTextField;
  ForgotPasswordPageController()
      : _presenter = serviceLocator<ForgotPasswordPagePresenter>(),
        usernameTextField = TextEditingController(text: ''),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    usernameTextField.dispose();
    super.onDisposed();
  }

  void onTextFieldChanged() {
    refreshUI();
  }

  void checkIfUserExists() {
    _stateMachine.onEvent(ForgotPasswordPageLoadingEvent());
    refreshUI();

    _presenter.doesUserExist(
      UseCaseObserver(() {}, _handleErrorState,
          onNextFunction: (bool doesExist) {
        if (doesExist) {
        } else {
          Fluttertoast.showToast(
              msg:
                  'This user is not registered. Please try another username or register');
          usernameTextField.text = '';
          _stateMachine.onEvent(ForgotPasswordPageErrorEvent());
          refreshUI();
        }
      }),
      username: usernameTextField.text.trim(),
    );
  }

  void getPassword() {
    _presenter.getPassword(
      UseCaseObserver(() {}, _handleErrorState,
          onNextFunction: (String password) {
        _stateMachine.onEvent(
            ForgotPasswordPagePasswordDisplayEvent(password: password));
        refreshUI();
      }),
      username: usernameTextField.text.trim(),
    );
  }

  void _handleErrorState(error) {
    _stateMachine.onEvent(ForgotPasswordPageErrorEvent());
    refreshUI();
  }

  ForgotPasswordState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
