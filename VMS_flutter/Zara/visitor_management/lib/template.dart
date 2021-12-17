import 'package:flutter/material.dart';
import 'package:visitor_management/home.dart';

PreferredSizeWidget appBars() {
  return AppBar(
    title: const Header(),
    toolbarHeight: 30,
    centerTitle: true,
    backgroundColor: Colors.white10,
    foregroundColor: Colors.blue.shade500,
    elevation: 0.0, // Remove shadow
  );
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      },
      child: const Text(
        'KABBEE',
        style: TextStyle(
          fontSize: 27.0,
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  // const Headline({Key? key}) : super(key: key);
  final String info;
  final double buttom;
  const Headline(this.info, this.buttom, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, buttom),
      child: Text(
        info,
        style: TextStyle(
          color: Colors.blue.shade500,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

class Divide extends StatelessWidget {
  final double width;
  const Divide(this.width, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width,
      child: Divider(
        thickness: 1.3,
        color: Colors.blue.shade500,
      ),
    );
  }
}

class Template extends StatelessWidget {
  final dynamic selectedPage;
  final String info;
  final double buttom;
  final double width;
  const Template(this.selectedPage, this.info, this.buttom, this.width,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //using material instead of scaffold
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade500),
      ),
      child: Scaffold(
        appBar: appBars(),
        body: Center(
          child: Column(
            children: [
              Divide(width),
              Headline(info, buttom),
              selectedPage,
            ],
          ),
        ),
      ),
    );
  }
}
