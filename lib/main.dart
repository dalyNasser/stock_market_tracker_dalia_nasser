import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/pages/home_screen.dart';
import 'package:stock_market_tracker_dalia_nasser/states/theme_state/theme_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/text_widget.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context,state) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state is ThemeDark ? ThemeMode.dark : ThemeMode.light,
          home: HomeScreen(),
        );
      }),
    );
  }
}


