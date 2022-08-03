import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';
import 'package:quiz_app/ui/utils/theme.dart';

class SignupEmail extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  // final Users user ;

  GlobalKey<FormFieldState> emailKey;
  TextEditingController controller;
  EmailValidator validator;
  Users user;
  List<Users> allUsers;
  SignupEmail(
      {Key? key,
      required this.user,
      required this.validator,
      required this.emailKey,
      required this.controller,
      required this.allUsers})
      : super(key: key);

  bool isEmailRegistered(String email) {
    bool isAvailable = false;
    ///// print(allUsers);
    for (user in allUsers) {
      if (user.email == email) {
        isAvailable = true;
      }
    }
    return isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
          vertical: SizeConfig.screenWidth * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'Create account'.tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: getProportionateScreenWidth(30), //40,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.30),
        ),
        Text(
          'please tell us more about you'.tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: getProportionateScreenWidth(10), //20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.50),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: (value) {
                user.email = value!.toLowerCase();
              },
              controller: controller,
              key: emailKey,
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'You need A valid email Address'.tr;
                } else if (isEmailRegistered(value)) {
                  print(isEmailRegistered(value));
                  return 'Email is already registered '.tr;
                }
                print(isEmailRegistered(value));
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'Enter email'.tr,
                labelStyle: TextStyle(fontSize: 16),
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    FontAwesomeIcons.solidEnvelope,
                    size: 28,
                    color: kblue,
                  ),
                ),
                // hintText: 'Enter email',
                // hintStyle: TextStyle(
                //     fontSize: 16,
                //     color: Theme.of(context).colorScheme.onPrimary,
                //     height: 1.5),
              ),
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 1.5),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: false,
            ),
            const SizedBox(
              height: 160,
            ),
          ],
        ),
      ]),
    );
    ;
  }
}

// class _SignupEmailState extends State<SignupEmail> {
//     //final Size _size = MediaQuery.of(context).size;
    
//     //final field2Key = GlobalKey<FormFieldState>();
//     final List<String?> errors = [];

//   // void addError({String? error}) {
//   //   if (!errors.contains(error))
//   //     setState(() {
//   //       errors.add(error);
//   //     });
//   // }

//   // void removeError({String? error}) {
//   //   if (errors.contains(error))
//   //     setState(() {
//   //       errors.remove(error);
//   //     });
//   // }
//   @override
//   Widget build(BuildContext context) {
    
//     return  Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 50),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             //mainAxisAlignment: MainAxisAlignment.spaceAround,
        
//             children: [
//               const Text(
//                 'Create account',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 0.30),
//               ),
//               const Text(
//                 'please tell us more about you',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w300,
//                     letterSpacing: 0.50),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
                  
//                   TextFormField(
//                     key: field1Key,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value){
//                       if(value!.isEmpty){
//                         return "You have to enter an email";
//                       }
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor:  Colors.grey[500]!.withOpacity(0.5),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
//                       suffixIcon: const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.0),
//                         child: Icon(
//                           FontAwesomeIcons.solidEnvelope,
//                           size: 28,
//                           color: kblue,
//                         ),
//                       ),
//                       hintText: 'Enter email',
//                       hintStyle: kBodyText,
//                     ),
//                     style: kBodyText,
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction:TextInputAction.next,
//                     obscureText: true,
//                    ),
                  
                  
//                   const SizedBox(
//                     height: 160,
//                   ),
                 
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
    
//   }

  // Container buildEmailField(){
  //   return Container(
  //       height: size.height * 0.09,
  //       width: size.width * 0.8,
  //       decoration: BoxDecoration(
  //         color: Colors.grey[500]!.withOpacity(0.5),
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //           child: TextFormField(
  //             validator: (value){},
  //             decoration: InputDecoration(
  //               border: InputBorder.none,
  //               suffixIcon: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                 child: Icon(
  //                   icon,
  //                   size: 28,
  //                   color: kblue,
  //                 ),
  //               ),
  //               hintText: hint,
  //               hintStyle: kBodyText,
  //             ),
  //             style: kBodyText,
  //             keyboardType: inputType,
  //             textInputAction: inputAction,
  //             obscureText: true,
  //           ),
  //         ),
  //       ),
  //     )
  // }
// }
