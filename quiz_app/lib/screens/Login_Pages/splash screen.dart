/*import 'package:flutter/material.dart';
import 'package:quiznew/pallete.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  /* void initState() {
    //todo:implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("bg.jpg"),
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 235, left: 10.0, right: 10.0, bottom: 15),
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //fit: BoxFit.cover,
                        image: AssetImage("bgm.jpg"),
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(66, 0, 0, 0), BlendMode.darken),
                      ),
                      borderRadius: BorderRadius.circular(50),

                      /* boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(146, 6, 23, 46).withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0.0, 250.0),
                        ),
                      ],*/
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      //child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //Center(
                          CircleAvatar(
                            backgroundColor: kblack,
                            radius: 77.0,
                            child: Row(
                              children: [
                                Text(
                                  'K',
                                  style: TextStyle(
                                      fontSize: 46,
                                      fontWeight: FontWeight.w900,
                                      color: kblue),
                                ),
                                Text(
                                  'abbe',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                      //fontFamily: 'Raleway',
                                      color: kWhite),
                                ),
                                Text(
                                  'e',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                      color: kblue),
                                ),
                              ],
                            ),
                          ),
                          //),
                        ],
                      ),
                      // ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Q',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: kblue,
                    letterSpacing: 1),
              ),
              Text(
                'uiz Ap',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: kWhite,
                    letterSpacing: 2),
              ),
              Text(
                'p',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: kblue,
                    letterSpacing: 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}*/
