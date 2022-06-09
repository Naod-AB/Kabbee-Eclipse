import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:auto_route/auto_route.dart';


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

import '../../../routes/router.gr.dart';

class Splash extends GetView<ProfileController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 4000), () {
      context.router.push( LoginRoute());
    });

    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 800,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg.jpg"),
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Container(
                      height: 280,
                      width: 350,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/bgm.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black12, BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.circular(140),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(146, 6, 23, 46)
                                .withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0.30, 250.0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: kblack,
                              radius: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'K',
                                    style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.w900,
                                        color: kblue),
                                  ),
                                  DefaultTextStyle(
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w900,
                                          color: kWhite),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TyperAnimatedText('abbe',
                                              speed: const Duration(
                                                  milliseconds: 300))
                                        ],
                                        pause: const Duration(seconds: 4),
                                      )),
                                  Flexible(
                                      child: DefaultTextStyle(
                                          style: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w900,
                                              color: kblue),
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              WavyAnimatedText('e',
                                                  speed: const Duration(
                                                      milliseconds: 500))
                                            ],
                                            pause: Duration(seconds: 2),
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Q',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(43),
                            fontWeight: FontWeight.w900,
                            color: kblue,
                            letterSpacing: 1),
                      ),
                      Text(
                        'uiz Ap',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(38),
                            fontWeight: FontWeight.w900,
                            color: kWhite,
                            letterSpacing: 2),
                      ),
                      Text(
                        'p',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(38),
                            fontWeight: FontWeight.w900,
                            color: kblue,
                            letterSpacing: 1),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
