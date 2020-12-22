import 'package:internship/main.dart';
import 'package:internship/redux/acts.dart';

AppState reducer(AppState prev, action) {
  switch (action) {
    case Acts.Increment:
      return new AppState((prev.pos + 1) % 5);
  }

  return prev;
}
