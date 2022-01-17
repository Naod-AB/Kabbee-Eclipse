import 'package:flutter/material.dart';

class Dayoff extends StatelessWidget {
  const Dayoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 500,
              child: DatePickerDialog(
                initialDate: DateTime(2021, 12, 1),
                firstDate: DateTime(2021, 12, 1),
                lastDate: DateTime(2092, 1, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
