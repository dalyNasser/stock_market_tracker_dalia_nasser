import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData.light())) {
    on<ToggleTheme>((event, emit) {
      final currentTheme = state.themeData;
      if (currentTheme == ThemeData.light()) {
        emit(ThemeState(ThemeData.dark()));
      } else {
        emit(ThemeState(ThemeData.light()));
      }
    });
  }
}