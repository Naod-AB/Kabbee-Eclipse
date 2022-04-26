import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/common_components/appbar.dart';




class FinalScore extends StatelessWidget {
  const FinalScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 17, 17, 17),
        //   actions: [
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => ProfileScreen()));
        //         },
        //         child: CircleAvatar(
        //             backgroundImage: AssetImage('assets/images/avatar.png'))),
        //     Padding(
        //         padding: EdgeInsets.only(
        //       right: 10,
        //     )),
        //   ],
        // ),
        appBar: quizeAppbar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(left: 2500, top: 50)),
              Title(
                color: Colors.white,
                child: Text(
                  'Your Score',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '10/10',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 165, 0),
                          fontSize: 64,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Visibility(
                visible: true,
                child: ElevatedButton(
                  child: const Text('REVIEW'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 165, 0), width: 1.5),
                      primary: Colors.transparent),
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(
                child: const Text(
                  'DONE',
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: const Color.fromARGB(255, 255, 165, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
