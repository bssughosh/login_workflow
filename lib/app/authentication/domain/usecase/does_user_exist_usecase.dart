import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class DoesUserExistUsecase extends CompletableUseCase<DoesUserExistParams> {
  final AuthenticationRepository _repository;

  DoesUserExistUsecase(this._repository);

  @override
  Future<Stream<bool>> buildUseCaseStream(DoesUserExistParams? params) async {
    StreamController<bool> streamController = StreamController();
    try {
      final bool _isExist =
          await _repository.doesUsernameExist(username: params!.username);
      log('$runtimeType: Checked successfully if user exists');
      streamController.add(_isExist);
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error when checking if user exists = $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class DoesUserExistParams {
  final String username;

  DoesUserExistParams(this.username);
}
