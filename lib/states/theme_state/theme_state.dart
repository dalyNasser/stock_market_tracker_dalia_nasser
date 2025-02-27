import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  ThemeState(this.themeData);

  @override
  List<Object?> get props => [themeData];
}