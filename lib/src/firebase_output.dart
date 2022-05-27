import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';

class FirebaseOutput extends LogOutput {
  List<Level> levels;

  FirebaseOutput({
    this.levels = const [Level.error, Level.warning, Level.debug,],
  });

  @override
  void output(OutputEvent event) {
    if (levels.contains(event.level)) {
      if (event.error != null || event.stackTrace != null) {
        FirebaseCrashlytics.instance.recordError(
            event.error,
            event.stackTrace,
            reason: event.message);
      } else {
        FirebaseCrashlytics.instance.log(event.message);
      }
    }
  }

}