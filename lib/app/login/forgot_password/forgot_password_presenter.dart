import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../core/presentation/use_case_observer.dart';
import '../../authentication/domain/usecase/get_forgot_password_code_usecase.dart';
import '../../authentication/domain/usecase/get_password_usecase.dart';
import '../../authentication/domain/usecase/verify_forgot_password_code_usecase.dart';

class ForgotPasswordPagePresenter extends Presenter {
  final GetForgotPasswordCodeUsecase _getForgotPasswordCodeUsecase;
  final VerifyForgotPasswordCodeUsecase _verifyForgotPasswordCodeUsecase;
  final GetPasswordUsecase _getPasswordUsecase;

  ForgotPasswordPagePresenter(this._getForgotPasswordCodeUsecase,
      this._verifyForgotPasswordCodeUsecase, this._getPasswordUsecase);

  @override
  dispose() {
    _getForgotPasswordCodeUsecase.dispose();
    _getPasswordUsecase.dispose();
    _verifyForgotPasswordCodeUsecase.dispose();
  }

  void getResetCode(UseCaseObserver observer) =>
      _getForgotPasswordCodeUsecase.execute(observer);

  void verifyCode(UseCaseObserver observer, {required String enteredCode}) =>
      _verifyForgotPasswordCodeUsecase.execute(
          observer, VerifyForgotPasswordCodeParams(enteredCode));

  void getPassword(UseCaseObserver observer, {required String username}) =>
      _getPasswordUsecase.execute(observer, GetPasswordParams(username));
}
