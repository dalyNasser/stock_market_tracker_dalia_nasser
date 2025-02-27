import 'package:flutter/material.dart';


class AssetImageWidget extends StatelessWidget {
   const AssetImageWidget({super.key,  this.img='assets/image/ic_main.png'});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Image.asset(img);
  }
}
