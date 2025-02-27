import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/controller/api_dio_service.dart';
import 'package:stock_market_tracker_dalia_nasser/models/response_model.dart';
import 'package:stock_market_tracker_dalia_nasser/pages/details_screen.dart';
import 'package:stock_market_tracker_dalia_nasser/setting/app_setting.dart';
import 'package:stock_market_tracker_dalia_nasser/states/connect_state/connect_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/states/theme_state/theme_bloc.dart';
import 'package:stock_market_tracker_dalia_nasser/states/theme_state/theme_event.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/card_widget.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ResponseModel> futureStockData;

  @override
  void initState() {
    super.initState();
    futureStockData = ApiDioService().fetchData();
      //saveData(futureStockData);
  }

  @override
  Widget build(BuildContext context) {
    final themeState = BlocProvider
        .of<ThemeBloc>(context)
        .state;

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Stock Market Tracker',
          font_color: AppSetting.fontColor,
        ),
        backgroundColor: AppSetting.mainColor,
        actions: [
          IconButton(
              icon: Icon(
                Icons.sync,
                color: AppSetting.fontColor,
              ),
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.dark_mode // Icon for dark mode
                  : Icons.light_mode,
              color: Colors.orangeAccent,// Icon for light mode
              size: 30,
            ),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
          ),
        ],
      ),
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, st) {
          return FutureBuilder<ResponseModel>(
            future: futureStockData,
            builder: (context, snapshot) {
              if (st is ConnectivityOnline) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No data available'));
              }
              }
             else if (st is ConnectivityOffline) {}

              final stockDataList = snapshot.data!.data;

              return ListView.builder(
                itemCount: stockDataList?.length,
                itemBuilder: (context, index) {
                  final stockData = stockDataList![index];
                  return CardWidget(
                    CompanyTxt: stockData.name ?? "Dalia",
                    symbolTxt: stockData.symbol ?? "DA",
                    price: stockData.adjHigh ?? 0,
                    changedPrice: stockData.adjHigh ?? 0,
                    onTap: () {  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(),
                      ),
                    );

                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
/*
Future<void>saveData(dynamic futureStockData) async{
  final SharedPreferences save_prefs = await SharedPreferences.getInstance();
  await save_prefs.setString('data',jsonEncode( futureStockData.toJson()));


}*/
