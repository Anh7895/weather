import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    super.onEvent(bloc!, event);
    debugPrint('>>>>>>> $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('>>>>>>> $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('>>>>>>> $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
