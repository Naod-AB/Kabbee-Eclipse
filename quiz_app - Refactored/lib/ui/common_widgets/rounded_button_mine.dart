import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/theme.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    this.isActive = true,
    required this.buttonName,
    required this.pressed,
  }) : super(key: key);
  bool isActive;
  final dynamic buttonName;
  final Callback pressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isActive ? pColor : Colors.grey,
      ),
      child: TextButton(onPressed: pressed, child: buttonName),
    );
  }
}

// rounded button

// loading progress

class LoadingRoundedButton extends StatelessWidget {
  LoadingRoundedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        // color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: null,
            child: SizedBox(
              child: CircularProgressIndicator(
                color: kblue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    required this.boxName,
    Key? key,
  }) : super(key: key);
  final String boxName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[500]!.withOpacity(0.5),
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: .0),
          child: Text(
            boxName,
            style: kBodyText.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
