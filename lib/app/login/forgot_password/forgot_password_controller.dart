import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../injection.dart';
import 'forgot_password_presenter.dart';
import 'forgot_password_state_machine.dart';

class ForgotPasswordPageController extends Controller {
  final ForgotPasswordPagePresenter _presenter;
  final ForgotPasswordPageStateMachine _stateMachine =
      ForgotPasswordPageStateMachine();
  ForgotPasswordPageController()
      : _presenter = serviceLocator<ForgotPasswordPagePresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  ForgotPasswordState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
