import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Utilities/size_config.dart';
import '../../widgets/pallete.dart';
import 'package:auto_route/auto_route.dart';
import '../../routes/router.gr.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    //todo:implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      context.router.push(LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 800,

          //height: 500,
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
                      height: 260,
                      width: 270,
                      //margin: EdgeInsets.symmetric(vertical: 40),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          //fit: BoxFit.cover,
                          image: AssetImage('assets/images/bgm.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black12, BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.circular(90),
                        // border: Border.all(
                        //  width: 1,
                        // ),

                        //borderRadius: BorderRadius.all(Radius.circular(50)),

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
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: kblack,
                              radius: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,

                                children: const [
                                  Text(
                                    'K',
                                    style: TextStyle(
                                        fontSize: 43,
                                        fontWeight: FontWeight.w900,
                                        color: kblue),
                                  ),
                                  Text(
                                    'abbe',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                        //fontFamily: 'Raleway',
                                        color: kWhite),
                                  ),
                                  Flexible(
                                    //flex: 3,
                                    child: Text(
                                      'e',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w900,
                                          color: kblue),
                                    ),
                                  ),
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
                            fontSize: getProportionateScreenWidth(43), //,45,
                            fontWeight: FontWeight.w900,
                            color: kblue,
                            letterSpacing: 1),
                      ),
                      Text(
                        'uiz Ap',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(38), //38,
                            fontWeight: FontWeight.w900,
                            color: kWhite,
                            letterSpacing: 2),
                      ),
                      Text(
                        'p',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(38), // 38,
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
