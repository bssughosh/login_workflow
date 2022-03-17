import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../core/presentation/use_case_observer.dart';
import '../authentication/domain/usecase/signup_usecase.dart';

class SignUpPagePresenter extends Presenter {
  final SignUpUsecase _signUpUsecase;

  SignUpPagePresenter(this._signUpUsecase);

  @override
  dispose() {
    _signUpUsecase.dispose();
  }

  void signUp(UseCaseObserver observer,
          {required String username, required String password}) =>
      _signUpUsecase.execute(observer, SignUpParams(username, password));
}
