import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class SignUpUsecase extends CompletableUseCase<SignUpParams> {
  final AuthenticationRepository _repository;

  SignUpUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(SignUpParams? params) async {
    StreamController<void> streamController = StreamController();
    try {
      await _repository.signUp(
        username: params!.username,
        password: params.password,
      );
      log('$runtimeType: Signed up user successfully');
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error while signing in user = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class SignUpParams {
  final String username;
  final String password;

  SignUpParams(this.username, this.password);
}
