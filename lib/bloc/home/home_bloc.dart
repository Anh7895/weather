
import 'package:weather/bloc/base_state/base_state.dart';
import 'package:weather/datasource/repository/login_repository.dart';
import 'package:bloc/bloc.dart';


import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final LoginRepository loginRepository;


  HomeBloc(this.loginRepository)
      : super(StartHomeState()) {
    //Validate

  }

}


