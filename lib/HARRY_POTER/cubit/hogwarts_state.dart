import 'package:admin_dashboard/HARRY_POTER/services/model.dart';

abstract class HogwartsState {}

class FetchLoadingState extends HogwartsState {}

class FetchSuccessState extends HogwartsState {
  final List<HogartsFamily> characters;
  FetchSuccessState(this.characters);
}

class FetchFailedState extends HogwartsState {
  final String failureMessage;
  FetchFailedState(this.failureMessage);
}
