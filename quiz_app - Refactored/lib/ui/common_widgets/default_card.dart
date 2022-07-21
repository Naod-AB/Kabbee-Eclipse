// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:quiz_app/ui/utils/pallete.dart';
// import 'package:quiz_app/ui/utils/theme.dart';

// //import '../../constants.dart';

// class ChoiceCard extends StatelessWidget {
//   final String imgeSrc, cardtext;
//   double? imgPosX, textPosx, imgPosY, textPosy, imgheig, imgwid;

//   final VoidCallback onpressed;
//   ChoiceCard(
//       {Key? key,
//       required this.imgeSrc,
//       required this.cardtext,
//       required this.onpressed,
//       this.textPosx = 40,
//       this.textPosy = 15,
//       this.imgPosX = 205,
//       this.imgPosY = -35,
//       this.imgheig = 260,
//       this.imgwid = 100})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenhieght = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           InkWell(
//             onTap: onpressed,
//             child: Container(
//               width: screenwidth * 0.8,
//               height: screenhieght * 0.20,
//               decoration: BoxDecoration(
//                   color: pColor, borderRadius: BorderRadius.circular(25)),
//             ),
//           ),
//           Positioned(
//               height: imgheig,
//               width: imgwid,
//               left: imgPosX,
//               top: imgPosY,
//               child: SvgPicture.asset(imgeSrc)),
//           Positioned(
//               left: textPosx,
//               bottom: textPosy,
//               child: Text(
//                 cardtext,
//                 style: Theme.of(context).textTheme.headline1,
//               ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/theme.dart';

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
              child:
                  Text(cardtext, style: Theme.of(context).textTheme.headline6)),
          Positioned(
              left: textPosx, top: textPosy! - 10, child: child ?? Container())
        ],
      ),
    );
  }
}

const colorizeColors = [kWhite, kblue, Colors.black];
const colorizeTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);
