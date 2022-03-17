import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../core/presentation/use_case_observer.dart';
import '../authentication/domain/usecase/get_logged_in_user_usecase.dart';
import '../authentication/domain/usecase/logout_usecase.dart';

class HomePagePresenter extends Presenter {
  final LogoutUsecase _logoutUsecase;
  final GetLoggedInUserUsecase _getLoggedInUserUsecase;

  HomePagePresenter(this._logoutUsecase, this._getLoggedInUserUsecase);

  @override
  dispose() {
    _logoutUsecase.dispose();
    _getLoggedInUserUsecase.dispose();
  }

  void logout(UseCaseObserver observer) => _logoutUsecase.execute(observer);

  void getUser(UseCaseObserver observer) =>
      _getLoggedInUserUsecase.execute(observer);
}
