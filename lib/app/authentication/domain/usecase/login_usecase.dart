import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class LoginUsecase extends CompletableUseCase<LoginParams> {
  final AuthenticationRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(LoginParams? params) async {
    StreamController<void> streamController = StreamController();
    try {
      await _repository.login(
        username: params!.username,
        password: params.password,
      );
      log('$runtimeType: Logged in user');
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error while logging in = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams(this.username, this.password);
}
