import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repository/authentication_repository.dart';

class GetLoggedInUserUsecase extends CompletableUseCase<void> {
  final AuthenticationRepository _repository;

  GetLoggedInUserUsecase(this._repository);

  @override
  Future<Stream<String>> buildUseCaseStream(params) async {
    StreamController<String> streamController = StreamController();
    try {
      final String _username = _repository.loggedInUser;
      log('$runtimeType: Get username successfully');
      streamController.add(_username);
      streamController.close();
    } catch (error) {
      log('$runtimeType: Error in get username $error');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
