
import 'package:learn_libraries/flutter_redux/actions.dart';

int myReducer(int state, dynamic action) {
  switch (action) {
    case MyActions.Add:
      state += 1;
      break;
    case MyActions.Minus:
      state -= 1;
      break;
  }
  return state;
}