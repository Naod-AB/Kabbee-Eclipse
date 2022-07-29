// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

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
