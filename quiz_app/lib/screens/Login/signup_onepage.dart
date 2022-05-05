
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Utilities/size_config.dart';
import 'package:quiz_app/api.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';
import 'package:quiz_app/screens/Login/login_screen.dart';
import 'package:quiz_app/widgets/rounded_button_mine.dart';
import 'package:quiz_app/widgets/theme.dart';

//import '../../widgets/widgets.dart';
import '../../Models/users.dart';
import 'signUp_password.dart';
import 'signup_email.dart';
import 'signup_name.dart';


class OneSignupPage extends StatefulWidget {

  OneSignupPage({Key? key}) : super(key: key);

  @override
  State<OneSignupPage> createState() => _OneSignupPageState();
}

class _OneSignupPageState extends State<OneSignupPage> {
  ProfileController controller= Get.find();
  //var emailFieldkey = GlobalKey<FormFieldState>();  
  final _formKey =GlobalKey<FormState>();
  // var passFieldKey = GlobalKey<FormFieldState>();
  // var confirmFieldKey = GlobalKey<FormFieldState>();
  // var firstNameFieldKey = GlobalKey<FormFieldState>();
  // var lastNameFieldKey = GlobalKey<FormFieldState>(); 
  int _index=0;
   @override
   void dispose() {
    // TODO: implement dispose
    
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {   
    
    Users user = Users() ; 
    EmailValidator emailValidator=EmailValidator();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        leading: const BackButton(),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Form(
        key:_formKey,
        child: Container(
          height: SizeConfig.screenHeight *0.85 ,
          child: Column(
            children: [
              Theme(
                data: ThemeData(canvasColor: bgColor),
                child: Expanded(
                  child: Stepper(
                    controlsBuilder: (context, ControlsDetails details) {
                              return Row(
                                children: <Widget>[
                                  Container(),
                                  Container(),
                                ],
                              );
                            },
                    // onStepTapped: (currentIndex){
                    //    if(currentIndex>_index){

                    //      if(controller.emailFieldKey.value.currentState!.validate())
                    //             setState(() {                        
                    //               _index=currentIndex;
                    //             });
                    //             } else{
                    //               setState(() {
                    //                 _index=currentIndex;
                    //               });
                    //             }
                    //     },
                    type: StepperType.horizontal,
                    currentStep: _index,
                    steps: [
                            
                      Step(
                              state: _index==0?StepState.editing:StepState.complete,                        
                              isActive: _index>=0,
                              title:  Text( "Email",style:TextStyle(color: Colors.white),) ,
                              content:Center(
                                child:SignupEmail(
                                  user: user,
                                  controller: controller.emailController.value,//_emailController ,
                                  emailKey: controller.emailFieldKey.value,//emailFieldkey, 
                                  validator: emailValidator,)
                                  )
                      ),
                      Step(
                              state: _index<=1?StepState.editing:StepState.complete,
                              isActive: _index>=1,
                              title:  Text( "Password",style:TextStyle(color: Colors.white)) ,
                              content: Center(
                                child: SignupPassword(
                                  user: user,
                                  passController: controller.passwordController.value,//_passwordController, 
                                  passKey: controller.passFieldKey.value,//passFieldKey, 
                                  confirmController: controller.confirmController.value,// _confimController, 
                                  confirmKey: controller.confirmFieldKey.value//confirmFieldKey,
                                  )
                                )
                              ),
                      Step(
                                  state:_index<=1?StepState.editing:StepState.complete,
                                  isActive: _index>=2,
                                  title: const Text( "Full Name",style:TextStyle(color: Colors.white)) ,
                                  content://Container()
                                    SignupName(
                                      firstNameController: controller.firstNameController.value,//_firstNameController, 
                                      firtNameKey: controller.firstNameFieldKey.value,//firstNameFieldKey, 
                                      lastNameController: controller.lastNameController.value,//_lastNameController, 
                                      lastNameKey: controller.lastNameFieldKey.value,//lastNameFieldKey, 
                                      user: user,)
                                  ),                        
                                  ]),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.09),
                child: Row(
                  children: [
                    if(_index!=0)
                    Expanded(
                      child: RoundedButton(
                        buttonName: "Back",
                         
                        pressed:(){
                          setState(() {
                            _index--;
                          });
                        }
                        ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth*0.01,),
                    Expanded(
                      child: RoundedButton(
                        buttonName: "Next", 
                        pressed:() async {

      if(_index==0){                   
      if(controller.emailFieldKey.value.currentState!.validate()){
        //print(emailFieldkey.currentState!.errorText);
          setState(() {
        _index+=1;
      });
      }
    }else if(_index==1){
      if(controller.passFieldKey.value.currentState!.validate()&&
          controller.confirmFieldKey.value.currentState!.validate()){
        // print("passFieldKey.currentState!.errorText");
        // print(_index);
          setState(() {
        _index+=1;
       // print(_index);
      });
      }

    } else if(_index==2){
      print(_index);
      if(controller.firstNameFieldKey.value.currentState!.validate()&&
          controller.lastNameFieldKey.value.currentState!.validate()){
            _formKey.currentState!.save();// saving the data in the in a local API (Json format)
           user.gender=controller.selectedGender.value;
            await createUser(user);
            context.router.pushNamed("/login");
      // Get.to(LoginPage());

                
                              }
                            }
                          }
                        ),
                    ),
                  ],
                ),
              )
            ],
          ) 
          ),
      ),
    );

  }


void fieldValidation(){

      if(_index==0){                   
      if(controller.emailFieldKey.value.currentState!.validate()){
        //print(emailFieldkey.currentState!.errorText);
          setState(() {
        _index+=1;
      });
      }
    }else if(_index==1){
      if(controller.passFieldKey.value.currentState!.validate()&&
          controller.confirmFieldKey.value.currentState!.validate()){
        print("passFieldKey.currentState!.errorText");
        print(_index);
          setState(() {
        _index+=1;
        print(_index);
      });
      }

    } else if(_index==2){
      print(_index);
      if(controller.firstNameFieldKey.value.currentState!.validate()&&
          controller.lastNameFieldKey.value.currentState!.validate()){
            _formKey.currentState!.save();// saving the data in the in a local API (Json format)
          
        Get.to(LoginPage());

      
      }
    }
  }

}
 