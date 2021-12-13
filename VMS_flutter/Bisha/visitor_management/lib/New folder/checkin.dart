// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(
      // home: checkin(),
    // ));

class checkin extends StatelessWidget {
  const checkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 1200,
        height: 700,
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue, width: 1.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 6),
              child: Text(
                'KABBEE',
                style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white),
              ),
            ),
            const FractionallySizedBox(
              widthFactor: 0.7,
              child: Divider(
                color: Colors.lightBlue,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('YOU ARE CHECKED IN AT ',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 12)),
                check_inSecond('7:45 AM'),
                SizedBox(
                  height: 100,
                ),
                done('DONE'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class check_inSecond extends StatelessWidget {
  // const SButtons(String s, {Key? key, required this.info}) : super(key: key);

  final String info;
  check_inSecond(this.info);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Container(
          //constraints: BoxConstraints(maxHeight: 45, maxWidth: 500),
          height: 45,

          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 1.0)),
          child: Center(
            child: Text(
              info,
              style: const TextStyle(fontSize: 18, color: Colors.lightBlue),
            ),
          ),
          // style: OutlinedButton.styleFrom(
          //   fixedSize: const Size(500, 45),
          //   side: const BorderSide(width: 1.0, color: Colors.lightBlue),
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(1)),
          //   ),
        ),
      ),
//onPressed: () {},
    );
  }
}

// ignore: camel_case_types
class done extends StatelessWidget {
  // const SButtons(String s, {Key? key, required this.info}) : super(key: key);

  final String info;
  // ignore: use_key_in_widget_constructors
  const done(this.info);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      child: OutlinedButton(
        child: Text(
          info,
          style: const TextStyle(fontSize: 18, color: Colors.lightBlue),
        ),
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(200, 50),
          side: const BorderSide(width: 1.0, color: Colors.lightBlue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
        ),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => option()));
        },
      ),
    );
  }
}
