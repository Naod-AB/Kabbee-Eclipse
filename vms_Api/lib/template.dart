import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget appBars() {
  return AppBar(
    title: const Header(),
    centerTitle: true,
    foregroundColor: Colors.blue.shade500,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    toolbarHeight: 35,
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.brightness_6_sharp,
            color: Colors.blue.shade500,
          ),
          onPressed: () {
            if (Get.isDarkMode) {
              Get.changeThemeMode(ThemeMode.light);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
            }
          })
    ],
  );
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed('/');
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
        child: Text(
          'KABBEE',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HeadlineTxt extends StatelessWidget {
  final String info;
  final double bottomPadding;
  const HeadlineTxt(this.info, this.bottomPadding, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, bottomPadding),
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

class Dividerline extends StatelessWidget {
  final double widthfactor;
  const Dividerline(this.widthfactor, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthfactor,
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
  final double bottomPadding;
  final double width;
  const Template(this.selectedPage, this.info, this.bottomPadding, this.width,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade500),
      ),
      child: Scaffold(
        appBar: appBars(),
        body: Center(
          child: Column(
            children: [
              Dividerline(width),
              HeadlineTxt(info, bottomPadding),
              selectedPage,
            ],
          ),
        ),
      ),
    );
  }
}
