import 'package:flutter/material.dart';
import 'pallete.dart';
import 'user_profile_widget.dart';

class Regi extends StatelessWidget {
  const Regi({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

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
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28,
                    color: kblue,
                  ),
                ),
                hintText: hint,
                hintStyle: kText,
              ),
              style: kText,
              keyboardType: inputType,
              textInputAction: inputAction,
              //obscureText: true,
            ),
          ),
        ),
      ),
    );
  }
}

class TextG extends StatelessWidget {
  const TextG({
    Key? key,
    //required this.genderToggle,
  }) : super(key: key);
  //final dynamic genderToggle;

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
        child: Row(
          children: [
            Text(
              'Gender',
              style: kText,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: genderToggle(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
