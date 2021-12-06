// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:visitor_management/selection.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       widthFactor: 0.95,
//       heightFactor: 0.95,
//       child: TextButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Selection()));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 1.0, color: Colors.blue.shade500),
//           ),
//           child: Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading:
//                   false, // to make the back arrow in home disappear
//               backgroundColor: Colors.white,
//               foregroundColor: Colors.blue.shade500,
//               elevation: 0.0, // Remove shadow
//             ),
//             body: Container(
//               color: Colors.white,
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 80.0,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.60,
//                       child: FittedBox(
//                         child: Text(
//                           "WELCOME TO KABBEE CAMPUS",
//                           style: TextStyle(
//                               color: Colors.blue.shade500,
//                               fontSize: 45.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 70.0, // to create a space between two elements
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.50,
//                       child: FittedBox(
//                         child: Text(
//                           "WE ARE HAPPY YOU ARE HERE!",
//                           style: TextStyle(
//                             color: Colors.blue.shade500,
//                             fontSize: 30.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200.0, // to create a space between two elements
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: FittedBox(
//                         child: Text(
//                           "TOUCH THE SCREEN TO START",
//                           style: TextStyle(
//                             color: Colors.blue.shade500,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
