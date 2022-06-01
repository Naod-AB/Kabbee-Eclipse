// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:quiz_app/widgets/theme.dart';
import 'pallete.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    this.isActive = true,
    required this.buttonName,
    required this.pressed,
  }) : super(key: key);
  bool isActive;
  final String buttonName;
  final Callback pressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isActive ? pColor : Colors.grey,
      ),
      child: TextButton(
        onPressed: pressed,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    required this.boxName,
    Key? key,
  }) : super(key: key);
  final String boxName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[500]!.withOpacity(0.5),
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: .0),
          child: Text(
            boxName,
            style: kBodyText.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// class Genders extends StatefulWidget {
//   const Genders({Key? key}) : super(key: key);
//   /*const Genders({
//     required this.gendername,
//     Key? key,
//   }) : super(key: key);
//   final String gendername;*/
//   @override
//   State<Genders> createState() => _GendersState();
// }

// class _GendersState extends State<Genders> {
//   final List<bool> _selections = List.generate(2, (index) => false);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       // backgroundColor: Colors.black,
//       //body: Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: size.height * 0.08,
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: Colors.grey[500]!.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Gender',
//                       style: kBodyText,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 276),
//                       //padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         //height: size.height * 0.01,
//                         //width: size.width * 0.1,
//                         //height: 0.01,
//                         //width: 0.01,
//                         decoration: BoxDecoration(
//                           color: kWhite,
//                         ),
//                         child: ToggleButtons(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 //gendername,
//                                 'Females',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: kblack,
//                                     //backgroundColor: kWhite,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Males',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: kblack,
//                                     //backgroundColor: kWhite,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             )
//                           ],
//                           isSelected: _selections,
//                           onPressed: (int index) {
//                             setState(() {
//                               // _selections[index] = !_selections[index];
//                               for (int i = 0; i < _selections.length; i++) {
//                                 _selections[i] = i == index;
//                               }
//                             });
//                           },
//                           color: Colors.black,
//                           fillColor: kblue,
//                           renderBorder: false,
//                           //borderRadius: BorderRadius.circular(10),
//                           borderWidth: 3,
//                           borderColor: kblack,
//                           selectedBorderColor: kblue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       //),
//     );
//   }
// }
