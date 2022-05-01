fxbimport 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Questions.dart';
import '../controllers/controllo.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    Controllo _questionController = Get.put(Controllo());
    return Expanded(
        child: SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(20),
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 88, 79, 79),
            //color: Color.fromARGB(255, 237, 4, 4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                question.question.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Column(children: [
                // ...List.generate(
                //     question.options!.toList().length,
                //     (index) => Option(
                //         text: question.options![index].toString(),
                //         index: index,
                //         press: () {}))
                // for (var i = 0; i < question.options.length; i++)
                // Option(question: question.options[i],index: i)
                Option(question: question.options)
                // question.options[i].((choice) =>  Text(choice)).toList(),

                // .map((choices) => Option(question: choices.options))
                // .toList()
              ])
            ],
          ),
        ),
      ),
    ));
  }
}
