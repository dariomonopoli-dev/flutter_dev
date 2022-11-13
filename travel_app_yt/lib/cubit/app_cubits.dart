import 'package:bloc/bloc.dart';
import 'package:travel_app_yt/cubit/app_cubit_states.dart';
import 'package:travel_app_yt/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
      // ignore: empty_catches
    } catch (e) {}
  }
}
