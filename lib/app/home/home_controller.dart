import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/presentation/use_case_observer.dart';
import '../../injection.dart';
import '../../injection.dart' as di;
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

  void logoutUser() {
    _stateMachine.onEvent(HomePageLoadingEvent());
    refreshUI();

    _presenter.logout(
      UseCaseObserver(
        () {
          di.reset().then((_) {
            Fluttertoast.showToast(msg: 'Logged out succesfully!');
            _navigationService.navigateTo(NavigationService.signInRoute,
                shouldReplace: true);
          });
        },
        _handleErrorState,
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
