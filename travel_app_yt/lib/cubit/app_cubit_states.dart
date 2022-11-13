import 'package:equatable/equatable.dart';
import 'package:travel_app_yt/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override //repsonsible for showing the first page
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override //repsonsible for showing the first page
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override //repsonsible for showing the first page
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [places];
}
