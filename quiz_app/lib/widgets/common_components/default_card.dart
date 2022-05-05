// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';

class ChoiceCard extends StatelessWidget {
  final String imgeSrc, cardtext;
  double? imgPosX, textPosx, imgPosY, textPosy, imgheig, imgwid;

  final VoidCallback onpressed;
  ChoiceCard(
      {Key? key,
      required this.imgeSrc,
      required this.cardtext,
      required this.onpressed,
      this.textPosx = 40,
      this.textPosy = 15,
      this.imgPosX = 10,
      this.imgPosY = -35,
      this.imgheig = 260,
      this.imgwid = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenhieght = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: onpressed,
            child: Container(
              width: screenwidth * 0.8,
              height: screenhieght * 0.20,
              decoration: BoxDecoration(
                  color: pColor, borderRadius: BorderRadius.circular(25)),
            ),
          ),
          Positioned(
              height: imgheig,
              width: imgwid,
              //right: imgPosX,
              top: imgPosY,
              child: SvgPicture.asset(imgeSrc),
              right: imgPosX),
          Positioned(
              left: textPosx,
              bottom: textPosy,
              child: Text(
                cardtext,
                style: Theme.of(context).textTheme.headline1,
              ))
        ],
      ),
    );
  }
}
