import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:login_workflow/app/authentication/domain/repository/authentication_repository.dart';

class LogoutUsecase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  LogoutUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    StreamController<void> streamController = StreamController();
    try {
      await _repository.logout();
      log('$runtimeType: Logged out user');
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error while logging out user $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
