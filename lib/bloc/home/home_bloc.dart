import 'package:dio/dio.dart';
import 'package:weather/bloc/base_state/base_state.dart';
import 'package:bloc/bloc.dart';
import 'package:weather/datasource/data/model/reponse/home_response.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(StartHomeState()) {
    on<GetDataHomeEvent>((event, emit) => getHomeWeather(event, emit));
  }

  HomeResponse homeResponse = HomeResponse();

  HomeRequest buildHome() {
    return HomeRequest(appid: '36c6afeee531eb6d4daaf6265cc4739d', lat:'9.915951', lon: '105.699334');
  }


  Future<void> getHomeWeather(GetDataHomeEvent event,
      Emitter<BaseState> emit) async {
    emit(StartCallApiState());
    // try {
      final response = await homeRepository.getWeather(event.homeRequest);
      homeResponse = response;
      if (response != null) {
        emit(GetDataHomeSuccessState(homeResponse: homeResponse));
      }
    //   else {
    //     emit(ApiErrorState(
    //         errorMessage: "Get data detail false"
    //     ));
    //   }
    // } on DioError catch (e) {} catch (e) {}
  }
}
