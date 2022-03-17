import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class GetForgotPasswordCodeUsecase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  GetForgotPasswordCodeUsecase(this._repository);

  @override
  Future<Stream<String>> buildUseCaseStream(params) async {
    StreamController<String> streamController = StreamController();
    try {
      final String code = await _repository.getForgotPasswordCode();
      log('$runtimeType: Got code for forgot password');
      streamController.add(code);
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error while getting code = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
