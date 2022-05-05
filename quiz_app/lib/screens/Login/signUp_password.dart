import 'package:flutter/material.dart';



import '../../Models/users.dart';
import '../../widgets/pallete.dart';
import '../../widgets/user_profile_widget.dart';

class SignupPassword extends StatelessWidget {
   Users user;
   TextEditingController passController ;
   TextEditingController confirmController;
   GlobalKey<FormFieldState> passKey;
   GlobalKey<FormFieldState> confirmKey;
  //  PasswordValidator passwordValidator = new PasswordValidator(
  //    uppercase: 1,
  //    min: 6,
  //    digits: 1
  //  );
   SignupPassword({Key? key, 
      required this.user,
      required this.passController,
      required this.passKey,
      required this.confirmController,
      required this.confirmKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
       return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.30),
            ),
            const Text(
              'please enter your password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.50),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 TextFormField( 
                  controller: passController,
                  key: passKey,
                  onSaved: (value){
                    user.password=value;
                  },                 
                  validator:(value){
                  if (!validateStructure(value!)) 
                   {
                    return 'Enter a Valid Password';
                      }
                 },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
                    suffixIcon:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child:passwordVisibilityBtn(),
                      //  Icon(
                      //   FontAwesomeIcons.solidEnvelope,
                      //   size: 28,
                      //   color: kblue,
                      // ),
                    ),
                    hintText: 'Enter Password',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  obscureText: true,
                 ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField( 
                  controller: confirmController,
                  key: confirmKey,                 
                  validator:(value){
                  if (confirmController.text!=passController.text) 
                  {
                    return 'The Two password need to be  the same ';
                      }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
                    suffixIcon:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: passwordVisibilityBtn(),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction:TextInputAction.next,
                  obscureText: true,
                 ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Tooltip(
                      message: "* Password have to have 6 or more in length \n * Need to have at least on UpperCase letter \n * at least one digit  ",
                      waitDuration: Duration(microseconds: 500),
                      showDuration: Duration(seconds: 1),
                      child:Container(
                        decoration: BoxDecoration(
                           color: Colors.grey,
                           borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(Icons.question_mark)) 
                    )
                  ],)
               
              ],
            ),
          ]
          ),
        
      
    );
  }
  bool validateStructure(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }
}
