// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/user_profile_widget.dart';

class MyScoresScreen extends StatelessWidget {
  const MyScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: customText('My Scores', 18, false, false, primaryColor),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: customText('FRONT END', 18, false, false, primaryColor),
            ),
            SizedBox(height: 7),
            sampleCard(context, FontAwesomeIcons.css3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: customText('API', 18, false, false, primaryColor),
            ),
            SizedBox(height: 7),
            sampleCard(context, FontAwesomeIcons.networkWired),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: customText('BACK END ', 18, false, false, primaryColor),
            ),
            SizedBox(height: 7),
            sampleCard(context, FontAwesomeIcons.aws),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:
                  customText('AVERAGE SCORE', 18, false, false, primaryColor),
            ),
            SizedBox(height: 7),
            sampleCard(context, FontAwesomeIcons.handsClapping),
          ],
        ),
      ),
    );
  }
}
