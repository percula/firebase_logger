import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';

class FirebaseOutput extends LogOutput {

  /// Which log [Level]s to send to Firebase
  List<Level> levels;

  FirebaseOutput({
    this.levels = const [Level.error, Level.warning, Level.debug,],
  });

  @override
  void output(OutputEvent event) {
    if (levels.contains(event.level)) {
      if (event.origin.error != null || event.origin.stackTrace != null) {
        FirebaseCrashlytics.instance.recordError(
            event.origin.error,
            event.origin.stackTrace,
            reason: event.origin.message);
      } else {
        FirebaseCrashlytics.instance.log(event.origin.message);
      }
    }
  }

}