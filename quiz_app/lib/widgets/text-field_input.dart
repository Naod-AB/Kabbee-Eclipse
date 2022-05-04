import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Models/users.dart';
import 'pallete.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.isPass
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final isPass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kblue,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

class Regi extends StatelessWidget {
   Users user;   
   TextEditingController controller;   
   GlobalKey<FormFieldState> fieldkey;
   Regi({
    Key? key, 
    required this.controller,
    required this.fieldkey,
    required this.user,
    required this.icon,
    required this.hint,
    required this.isPass,
    
    this.validator,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final bool isPass;
   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              key: fieldkey,
              validator: validator,
              onSaved: (value){
                if(hint.contains("first"))
                {user.firstName =value!;}else
                {user.lastName = value!;}
              },
              decoration: InputDecoration(
                fillColor:  Colors.grey[500]!.withOpacity(0.5),
                border: InputBorder.none ,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28,
                    color: kblue,
                  ),
                ),
                hintText: hint,
                hintStyle: kBodyText,
              ),
              style: kBodyText,
              keyboardType: inputType,
              textInputAction: inputAction,
              obscureText: isPass,
            ),
          ),
        ),
      ),
    );
  }
}

/*class Regi extends StatelessWidget {
  const Regi({
    Key? key,
    required this.hint,
    required this.icon,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: kBlue,
            ),
            Text('yjhghjg')
          ],
        ),
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 133, 16, 16)!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),

        /* child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: kBodyText,
             // prefixIcon: Padding(
                //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //padding: const EdgeInsetsDirectional.only(end: 20),
                child:] Icon(
                  icon,
                  size: 28,
                  color: kBlue,
                ),
             // ),
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
       ),*/
      ),
    );
  }
}*/

class TextG extends StatelessWidget {
  const TextG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey[500]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Gender',
          style: kBodyText,
        ),
      ),
    );
  }
}
