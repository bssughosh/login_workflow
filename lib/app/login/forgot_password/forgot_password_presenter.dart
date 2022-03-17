import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../core/presentation/use_case_observer.dart';
import '../../authentication/domain/usecase/does_user_exist_usecase.dart';
import '../../authentication/domain/usecase/get_password_usecase.dart';

class ForgotPasswordPagePresenter extends Presenter {
  final GetPasswordUsecase _getPasswordUsecase;
  final DoesUserExistUsecase _doesUserExistUsecase;

  ForgotPasswordPagePresenter(
    this._getPasswordUsecase,
    this._doesUserExistUsecase,
  );

  @override
  dispose() {
    _getPasswordUsecase.dispose();
    _doesUserExistUsecase.dispose();
  }

  void getPassword(UseCaseObserver observer, {required String username}) =>
      _getPasswordUsecase.execute(observer, GetPasswordParams(username));

  void doesUserExist(UseCaseObserver observer, {required String username}) =>
      _doesUserExistUsecase.execute(observer, DoesUserExistParams(username));
}
