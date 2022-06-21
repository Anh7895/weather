
import 'package:weather/bloc/base_state/base_state.dart';
import 'package:bloc/bloc.dart';


import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {


  HomeBloc()
      : super(StartHomeState()) {
    //Validate

  }

}


