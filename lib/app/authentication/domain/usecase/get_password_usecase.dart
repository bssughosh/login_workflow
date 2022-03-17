import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:login_workflow/app/authentication/domain/repository/authentication_repository.dart';

class GetPasswordUsecase extends CompletableUseCase<GetPasswordParams> {
  final AuthenticationRepository _repository;

  GetPasswordUsecase(this._repository);

  @override
  Future<Stream<String>> buildUseCaseStream(GetPasswordParams? params) async {
    StreamController<String> streamController = StreamController();
    try {
      final String password =
          await _repository.getPassword(username: params!.username);
      log('$runtimeType: Got password for user');
      streamController.add(password);
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error to get password = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class GetPasswordParams {
  final String username;

  GetPasswordParams(this.username);
}
