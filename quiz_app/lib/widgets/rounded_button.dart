// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.page,
  }) : super(key: key);

  final String buttonName;
  final dynamic page;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kblue,
      ),
      child: TextButton(
        onPressed: () {
          context.router.pushNamed(page);
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

// class Genders extends StatefulWidget {
//   const Genders({Key? key}) : super(key: key);

//   @override
//   State<Genders> createState() => _GendersState();
// }

// class _GendersState extends State<Genders> {
//   final List<bool> _selections = List.generate(2, (index) => false);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
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
//                   children: [
//                     Text(
//                       'Gender',
//                       style: kBodyText,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 276),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: kWhite,
//                         ),
//                         child: ToggleButtons(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Female',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: kblack,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Male',
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: kblack,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             )
//                           ],
//                           isSelected: _selections,
//                           onPressed: (int index) {
//                             setState(() {
//                               for (int i = 0; i < _selections.length; i++) {
//                                 _selections[i] = i == index;
//                               }
//                             });
//                           },
//                           color: Colors.black,
//                           fillColor: kblue,
//                           renderBorder: false,
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
