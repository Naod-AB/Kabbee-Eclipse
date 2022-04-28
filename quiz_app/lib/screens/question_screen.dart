import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/controllo.dart';
import '../widgets/qustionCard.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controllo _questionController = Get.put(Controllo());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 88, 79, 79),
        leading: const Icon(Icons.arrow_back_sharp),
        title: Container(
          width: 50,
          height: 50,
          child: SvgPicture.asset(
            'html5.svg',
            width: 45,
            height: 45,
            alignment: Alignment.center,
            color: Color.fromARGB(255, 241, 40, 26),
          ),
        ),
        actions: <Widget>[
          SvgPicture.asset(
            'user.svg',
            width: 50,
            height: 50,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Obx(
                () => Text.rich(
                  TextSpan(
                      text: '${_questionController.questionNumber.value}',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                            text:
                                '/${_questionController.questions.length.toString()}',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ))
                      ]),
                ),
              )),
          Expanded(
              child: PageView.builder(
                  itemCount: _questionController.questions.length,
                  onPageChanged: (val) {
                    _questionController.updateTheQnNum(val);
                  },
                  itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index],
                      ))),
        ],
      ),
    );
  }
}
