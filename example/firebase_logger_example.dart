import 'package:firebase_logger/src/firebase_output.dart';
import 'package:logger/logger.dart';

void main() {
  var logger = Logger(
      output: MultiOutput(
          [
            ConsoleOutput(),
            FirebaseOutput()
          ]
      )
  );

  try {
    final myList = [];
    final thisWillNotWork = myList[42];
  } on Exception catch (e) {
    logger.e("Uh oh", e);
  }
}