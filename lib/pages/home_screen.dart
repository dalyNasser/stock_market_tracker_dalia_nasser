import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/states/theme_state/theme_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/card_widget.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = BlocProvider
        .of<ThemeBloc>(context)
        .state;

    return Scaffold(
        appBar: AppBar(
          title: TextWidget(text: 'Stock Market Tracker',),
          actions: [
            IconButton(
              icon: Icon(themeState is ThemeDark ? Icons.wb_sunny : Icons
                  .nightlight_round),
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
              },
            ),

          ],
        ),
        body: ListView.builder(
          itemCount: 10,

            itemBuilder: (context, index) {
          return CardWidget(txt: 'hello')
          ;
        })
    );
  }
}
