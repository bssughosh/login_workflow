# Login Workflow

1. Run app

```bash
flutter run
```

2. Run integration tests on web

```bash
./chromedriver --port=4444

flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart -d web-server --no-headless
```

3. Run integration tests on mobile

```bash
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart
```
