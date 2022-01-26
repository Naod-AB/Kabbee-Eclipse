import 'package:flutter/material.dart';
import 'main.dart';

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

class HeadlineTxt extends StatelessWidget {
  final String info;
  final double buttom;
  const HeadlineTxt(this.info, this.buttom, {Key? key}) : super(key: key);
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

class Dividerline extends StatelessWidget {
  final double width;
  const Dividerline(this.width, {Key? key}) : super(key: key);
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
              Dividerline(width),
              HeadlineTxt(info, buttom),
              selectedPage,
            ],
          ),
        ),
      ),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBars(),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.all(20.0),
//           padding: EdgeInsets.all(3.0),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/$daynight'), fit: BoxFit.cover),
//             border: Border.all(color: Colors.blue.shade500),
//           ),
//           child: Column(
//             children: [
//               Divide(width),
//               Headline(info, buttom),
//               selectedPage,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }