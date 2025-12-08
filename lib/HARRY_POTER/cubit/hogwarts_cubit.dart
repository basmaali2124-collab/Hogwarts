import 'package:admin_dashboard/HARRY_POTER/cubit/hogwarts_state.dart';
import 'package:admin_dashboard/HARRY_POTER/services/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HogwartsCubit extends Cubit<HogwartsState> {
  HogwartsCubit() : super(FetchLoadingState()); 

  List<HogartsFamily> allCharacters = [];

  Future<void> fetchAllCharacters() async {
    emit(FetchLoadingState()); 
    try {
      final dio = Dio();
      final response = await dio.get('https://hp-api.onrender.com/api/characters');

      if (response.statusCode == 200) {
        allCharacters = (response.data as List)
            .map<HogartsFamily>((item) => HogartsFamily.fromJson(item))
            .toList();
        emit(FetchSuccessState(allCharacters)); 
      } else {
        emit(FetchFailedState("Error loading data")); 
      }
    } catch (e) {
      emit(FetchFailedState(e.toString()));
    }
  }

  Future<void> fetchCharacterByName(String name) async {  
    emit(FetchLoadingState()); 
    try {
      if (allCharacters.isEmpty) {
        await fetchAllCharacters();
      }

      HogartsFamily? character;
      try {
        character = allCharacters.firstWhere(
          (c) => c.name.toLowerCase().contains(name.toLowerCase()),
        );
      } catch (e) {
        character = null;
      }

      if (character != null) {
        emit(FetchSuccessState([character]));
      } else {
        emit(FetchFailedState("Character not found")); 
      }
    } catch (e) {
      emit(FetchFailedState("Failed to fetch data: ${e.toString()}")); 
    }
  }
}