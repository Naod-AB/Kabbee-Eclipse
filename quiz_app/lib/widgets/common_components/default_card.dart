import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../pallete.dart';
import '../theme.dart';

class ChoiceCard extends StatelessWidget {
  final String imgeSrc, cardtext;
  double? imgPosX, textPosx, imgPosY, textPosy, imgheig, imgwid;
  Widget? child;
  final VoidCallback onpressed;
  ChoiceCard(
      {Key? key,
      required this.imgeSrc,
      required this.cardtext,
      required this.onpressed,
      this.child,
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
              top: imgPosY,
              child: SvgPicture.asset(imgeSrc),
              right: imgPosX),
          Positioned(
              left: textPosx,
              bottom: textPosy,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.w900, color: kWhite),
                child: AnimatedTextKit(animatedTexts: [
                  ColorizeAnimatedText(cardtext,
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: Duration(milliseconds: 1000))
                ]),
              )),
          Positioned(left: textPosx, top: textPosy, child: child ?? Container())
        ],
      ),
    );
  }
}

const colorizeColors = [kWhite, Color(0xFFC0A404), Colors.black];
const colorizeTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);
