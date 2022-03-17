import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class VerifyForgotPasswordCodeUsecase
    extends CompletableUseCase<VerifyForgotPasswordCodeParams> {
  final AuthenticationRepository _repository;

  VerifyForgotPasswordCodeUsecase(this._repository);

  @override
  Future<Stream<bool>> buildUseCaseStream(
      VerifyForgotPasswordCodeParams? params) async {
    StreamController<bool> streamController = StreamController();
    try {
      final bool res = await _repository.verifyForgotPasswordCode(
        enteredCode: params!.enteredCode,
      );
      log('$runtimeType: Verified code successfully');
      streamController.add(res);
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error in validating code = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class VerifyForgotPasswordCodeParams {
  final String enteredCode;

  VerifyForgotPasswordCodeParams(this.enteredCode);
}
