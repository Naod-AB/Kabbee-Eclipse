import 'package:flutter/material.dart';
import 'buttons.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            OptionSelectionBtn('ADMIN'),
            OptionSelectionBtn('STAFF'),
            OptionSelectionBtn('STUDENT'),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Actionselector extends StatelessWidget {
  final String category;
  const Actionselector(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CheckInOutBtns('CHECK IN', category, "in"),
            const SizedBox(height: 35.0),
            CheckInOutBtns('CHECK OUT', category, "out"),
          ],
        ),
      ),
    );
  }
}
