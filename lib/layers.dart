import 'package:flutter/material.dart';

class LayerOne extends StatelessWidget {
  static const Color layerOne = Color(0x80FFFFFF);
  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthOfScreen,
      // height: 450,
      decoration: const BoxDecoration(
        color: layerOne,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(64.5), bottomRight: Radius.circular(0)),
      ),
    );
  }
}

class LayerTwo extends StatelessWidget {
  static const Color layerTwoBg = Color(0xFFE9FFF6);
  //double borderRadius = 60.0;     --- >>> file config

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width; //480
    print(
        "Double =      ******        $widthOfScreen        +++++++++"); //412 goshi

    double heightOfScreen = MediaQuery.of(context).size.height;
    print(
        "Double =      ******        $heightOfScreen         +++++++++"); //866 goshi

    return Container(
      width: widthOfScreen - widthOfScreen * 0.05, // masalan 400
      //height: 575,
      decoration: const BoxDecoration(
        color: layerTwoBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
    );
  }
}
