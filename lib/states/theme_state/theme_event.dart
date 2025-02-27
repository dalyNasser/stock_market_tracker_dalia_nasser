part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  @override
  List<Object> get props => [];
}
class ToggleTheme extends ThemeEvent {}
