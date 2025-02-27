import 'package:flutter/material.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/asset_image_widget.dart';
import 'package:stock_market_tracker_dalia_nasser/widget/text_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AssetImageWidget(),
          TextWidget(text:txt ,txt_size: 20,),
          Column(children: [
            TextWidget(text:txt ,),
            TextWidget(text:txt ,txt_size: 10,font_color: Colors.green,),


          ],)




        ],
      ),
    );
  }
}
