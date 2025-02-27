import 'package:flutter/material.dart';
import 'package:stock_market_tracker_dalia_nasser/setting/app_setting.dart';


class AssetImageWidget extends StatelessWidget {
   AssetImageWidget({super.key,  this.img='assets/image/ic_main.png'});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Image.asset(img);
  }
}
