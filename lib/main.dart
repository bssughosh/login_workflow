import 'package:flutter/material.dart';

import 'my_app.dart';
import 'injection.dart' as di;

Future<void> main({bool initDependencyInjection = true}) async {
  if (initDependencyInjection) {
    await di.init();
  } else {
    await di.reset();
  }

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
