import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:login_workflow/core/presentation/use_case_observer.dart';

import '../../injection.dart';
import '../navigation_service.dart';
import 'home_presenter.dart';
import 'home_state_machine.dart';

class HomePageController extends Controller {
  final HomePagePresenter _presenter;
  final HomePageStateMachine _stateMachine = HomePageStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  HomePageController()
      : _presenter = serviceLocator<HomePagePresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  void getUser() {
    _presenter.getUser(
      UseCaseObserver(
        () {},
        _handleErrorState,
        onNextFunction: (String userId) {
          _stateMachine.onEvent(HomePageInitializedEvent(loggedInUser: userId));
          refreshUI();
        },
      ),
    );
  }

  void _handleErrorState(error) {
    _stateMachine.onEvent(HomePageErrorEvent());
    refreshUI();
  }

  HomeState getCurrentState() {
    return _stateMachine.getCurrentState()!;
  }
}
