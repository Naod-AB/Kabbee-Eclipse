import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
//import 'package:quez_app/constants.dart';
class ChoiceCard extends StatelessWidget {

  final String imgeSrc,cardtext;
  double? imgPosX ,textPosx,imgPosY,textPosy;
  //double? test = 300;
  //double  screenWidth= MediaQuery.of(context).size.width
  final  VoidCallback onpressed ; // this will be usefull when we using the Inkwell for Onpress 
   ChoiceCard({
    Key? key, required this.imgeSrc, required this.cardtext,required this.onpressed,
      this.textPosx=100, this.textPosy=15,this.imgPosX=245,this.imgPosY=-35
  }) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
   double  screenhieght= MediaQuery.of(context).size.height;
   double  screenwidth= MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: defaultPadding*1.5),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: screenwidth*0.8,
              height: screenhieght*0.20,
                decoration: BoxDecoration(
                  color: pColor,
                  borderRadius: BorderRadius.circular(25)
              ),
            ),
            // Positioned(
            //     top: 15,
            //     left: 15,
            //     child: Container(
            //       width: 85,
            //       height: 80,
            //       decoration: BoxDecoration(
            //         border: Border.all(style: BorderStyle.solid),
            //         borderRadius: BorderRadius.circular(40)
            //       ),
            //       child: Center(
            //         child: Text("10/10",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            //       ),
            //     )
            //   ),
              Positioned(
                left: imgPosX,
                top:  imgPosY,
                child: SvgPicture.asset(imgeSrc)
                ),
              Positioned(
                  left:textPosx,
                  bottom:textPosy,
                  child: Text(cardtext,style: Theme.of(context).textTheme.headline1,))
          ],
        ),
      ),
    );
  }
}