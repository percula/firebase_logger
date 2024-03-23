An simple extension for [logger](https://pub.dev/packages/logger) that logs to Firebase Crashlytics

## Usage

```dart
final logger = Logger(
    output: MultiOutput(
        [
          if (!kDebugMode && crashlyticsSupported()) FirebaseOutput(),
          // other outputs
        ]
    )
);
```

By default, it will send all `Level.error`, `Level.warning`, and `Level.debug`
logs to Firebase. This can be customized via the `levels` parameter.