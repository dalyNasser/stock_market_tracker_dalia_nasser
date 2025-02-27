part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}
class ThemeLight extends ThemeState {}

class ThemeDark extends ThemeState {}