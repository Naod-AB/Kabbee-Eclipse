// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../../../utils/pallete.dart';
// import '../Controllers/auth_controller.dart';
// class LoginPage extends StatelessWidget {
//    LoginPage({Key? key}) : super(key: key);
//     GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     AuthController authController = Get.put(AuthController());
    
//     return Scaffold(
//       body: Form(
//             key:formKey, 
//             child: Column( 
//               children: [
//                 SizedBox(height: 40,),
//                 TextFormField(
//                   controller: authController.loginEmailController,
//                   decoration:  InputDecoration(
//                           filled: true,
//                          fillColor: Colors.grey[500]!.withOpacity(0.5),
//                          border: OutlineInputBorder(
//                              borderRadius:  BorderRadius.circular(15)),
//                             suffixIcon: const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Icon(
//                               FontAwesomeIcons.solidEnvelope,
//                               size: 28,
//                               color: kblue,
//                             ),
//                           ),
//                           hintText: 'Enter email',
//                           hintStyle: kBodyText,
//                         ),
                 
//                 ),



//                  const SizedBox(
//                     height: 10,
//                   ),
//                  TextFormField(
//                   controller: authController.loginPasswordController,
//                   //initialValue: authController.loginPasswordController.text,
//                   decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[500]!.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           suffixIcon: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Icon(
//                               FontAwesomeIcons.solidEnvelope,
//                               size: 28,
//                               color: kblue,
//                             ),
//                           ),
//                           hintText: 'Enter email',
//                           hintStyle: kBodyText,
//                         ),
//                 )
//               ],
//             )    ,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';


// ;
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart' as button;
import 'package:quiz_app/ui/utils/pallete.dart';
//import 'package:quiz_app/ui/utils/size_config.dart';



class LoginPage extends StatelessWidget {
  
  
  ProfileController profileController = Get.find();
  AuthController authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    String selam = 'selam@gmail.com';
    print("the page is reloading on it self ");
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal:20 ),//SizeConfig.screenWidth * 0.05
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20 //SizeConfig.screenHeight * 0.04,
              ),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,//getProportionateScreenWidth(40),
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 25),//SizeConfig.screenWidth * 0.05
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        key: emailKey,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) return "Email canot be empty ";
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[500]!.withOpacity(0.5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.solidEnvelope,
                              size: 28,
                              color: kblue,
                            ),
                          ),
                          hintText: 'Enter email',
                          hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 10//SizeConfig.screenHeight * 0.02,
                      ),
                      Obx(()=>TextFormField(
                        key: passKey,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) return "Password canot be empty";
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[500]!.withOpacity(0.5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                print(!authController.obsecure.value);
                                authController.obsecure.value=!authController.obsecure.value;
                                // setState(() {
                                //   _obscureText = !_obscureText;
                                // });
                              },
                              child: Icon(
                                authController.obsecure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: authController.obsecure.value
                                    ? Color.fromARGB(255, 255, 165, 0)
                                    : Color.fromARGB(255, 255, 165, 0),
                              ) 
                            ),
                            // child: Icon(
                            //   FontAwesomeIcons.lock,
                            //   size: 28,
                            //   color: kblue,
                            // ),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: authController.obsecure.value,
                      ),),
                      SizedBox(
                        height: 10//SizeConfig.screenHeight * 0.02,
                        //width:SizeConfig.screenHeight *0.5 //25,
                      ),
                      Obx(()=>
                      Text(
                        authController.error.value,
                        style: TextStyle(color: Colors.red),
                      ),) ,
                      Padding(
                        padding: EdgeInsets.only(
                            left:40 ),//SizeConfig.screenHeight * 0.08
                        child: Obx(()=>CheckboxListTile(
                          title: const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 16, color: kWhite1),
                          ),
                          value: authController.rememberMe.value,
                          onChanged: (value) {
                            authController.rememberMe.value=value!;
                            // setState(() {
                            //   rememberMe = value!;
                            // });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: kblue,
                          checkColor: kblack,
                          side: BorderSide(
                            color: kWhite1, //your desire colour here
                            width: 1.5,
                          ),
                        ),)
                      ),
                      SizedBox(
                        height:15//SizeConfig.screenHeight * 0.03, //25,
                      ),
                      button.RoundedButton(
                          buttonName: 'Login',
                          pressed:()=> authenticateUser(context)),
                      SizedBox(height:15 ),//SizeConfig.screenHeight * 0.03
                      SizedBox(
                        width: 50,//SizeConfig.screenWidth * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don`t have an account',
                            style: kText,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(() => const SignupEmail());
                              context.router.pushNamed('/signup');
                            },
                            child: const Text(
                              'Sign up',
                              style: kColorText,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),

              SizedBox(
                height: 15,//SizeConfig.screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    var pass = passwordController.text.trim();

    var email = emailController.text.trim().toLowerCase();
    print('email ${emailController.text}');
    if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
      profileController.userInfo.value = await fetchUser(email);
      if (profileController.userInfo.value != null &&
          profileController.userInfo.value!.password == pass) {
        profileController.scores =
            await fetchUserScores(profileController.userInfo.value!.id);
        // print('from login >>>> ${profileController.scores}');
        authController.error.value="";
        // setState(() {
        //   error = "";
        // });
        context.router.pushNamed('/category');
      } else {
        print("else to add the error");
        print(authController.error.value);
        authController.error.value="Email address or Password is incorrect";
        print(authController.error.value);

        // setState(() {
        //   error = "Email address or Password is incorrect";
        // });
      }
    }
  }
}
