import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

//import 'screens.dart';

class SignupName extends StatelessWidget {
   Users user;
   TextEditingController firstNameController ;
   TextEditingController lastNameController;
   GlobalKey<FormFieldState> firtNameKey;
   GlobalKey<FormFieldState> lastNameKey;
   SignupName({
    Key? key,
    required this.firstNameController,
    required this.firtNameKey,
    required this.lastNameController,
    required this.lastNameKey,
    required this.user
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*0.05),//50.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
               Text(
                'Create account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(30),//40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.30),
              ),
               Text(
                'please tell us more about you',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(10),//20,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.50),
              ),
               SizedBox(
                height:  15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField( 
                  onSaved: (value){
                    user.firstName = value;
                  },
                  controller: firstNameController,
                  key: firtNameKey,                 
                  validator:(value){
                   if(value!.isEmpty)
                       return "First Name cannot be empty";
                             
                  },
                  
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        size: 28,
                        color: kblue,
                      ),
                    ),
                    hintText: 'Enter First Name',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  obscureText: false,
                  ),
                  //  Regi(
                  //   icon: FontAwesomeIcons.solidUser,
                  //   hint: 'Enter first name',
                  //   inputType: TextInputType.name,
                  //   inputAction: TextInputAction.next,
                  //   isPass: controller.hidePassword.value,
                  //   validator: (value){
                  //     if(value!.isEmpty)
                  //     return "First Name cannot be empty";
                  //           }, 
                  //   controller: firstNameController,                     
                  //   fieldkey: firtNameKey,
                  //   user: user,
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField( 
                  onSaved: (value){
                    user.lastName = value;
                  },
                  controller: lastNameController,
                  key: lastNameKey,                 
                  validator:(value){
                   if(value!.isEmpty)
                       return "Last Name cannot be empty";
                             
                  },
                  
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        size: 28,
                        color: kblue,
                      ),
                    ),
                    hintText: 'Enter Last Name',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  obscureText: false,
                  ),
                  //  Regi(
                  //   icon: FontAwesomeIcons.solidUser,
                  //   hint: 'Enter last name',
                  //   inputType: TextInputType.name,
                  //   inputAction: TextInputAction.next,
                  //   isPass: !controller.hidePassword.value,
                  //   validator: (value){
                  //     if(value!.isEmpty)
                  //     return "Last Name cannot be empty";                
                  //     }, 
                  //   controller: lastNameController, 
                  //   fieldkey: lastNameKey, 
                  //   user: user,
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  genderToggle(2),
                  const SizedBox(
                    height: 100,
                  ),
                  // GestureDetector(
                  //   child: const RoundedButton(
                  //     buttonName: 'Register',
                  //     page:  LoginPage(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                ],
              ),
            ],
          ),
    );    
      }
}
