import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../core/presentation/use_case_observer.dart';
import '../authentication/domain/usecase/login_usecase.dart';

class LoginPagePresenter extends Presenter {
  final LoginUsecase _loginUsecase;

  LoginPagePresenter(this._loginUsecase);

  @override
  dispose() {
    _loginUsecase.dispose();
  }

  void login(UseCaseObserver observer,
          {required String username, required String password}) =>
      _loginUsecase.execute(observer, LoginParams(username, password));
}
