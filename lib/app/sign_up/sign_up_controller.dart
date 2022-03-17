import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../injection.dart';
import '../navigation_service.dart';
import 'sign_up_presenter.dart';
import 'sign_up_state_machine.dart';

class SignUpPageController extends Controller {
  final SignUpPagePresenter _presenter;
  final SignUpPageStateMachine _stateMachine = SignUpPageStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  SignUpPageController()
      : _presenter = serviceLocator<SignUpPagePresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  SignUpState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
