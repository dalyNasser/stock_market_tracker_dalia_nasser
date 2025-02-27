import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stock_market_tracker_dalia_nasser/setting/app_setting.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/asset_image_widget.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/text_widget.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {super.key,
      required this.CompanyTxt,
      required this.symbolTxt,
      required this.price,
      required this.changedPrice, required this.onTap});

  final String CompanyTxt;
  final String symbolTxt;
  final double price;
  final double changedPrice;
  final VoidCallback? onTap;


  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Color _randomColor = AppSetting.mainColor;

  @override
  void initState() {
    super.initState();
    _generateRandomColor();
  }

  Future<void> _generateRandomColor() async {
    _randomColor = await Color((Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
    setState(() {
      _randomColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Color(0xffDBDBDB),
        elevation: 20,
        margin: const EdgeInsets.all(10),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _randomColor,
                ),
                alignment: Alignment.center,
                child: TextWidget(
                  text: widget.symbolTxt,
                  font_color: Colors.white,

                ),
              ),
              TextWidget(
                text: widget.CompanyTxt,
                txt_size: 20,
              ),
              Column(
                children: [
                  TextWidget(
                    text: widget.price.toString(),
                  ),
                  TextWidget(
                    text: widget.changedPrice.toString(),
                    txt_size: 10,
                    font_color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
