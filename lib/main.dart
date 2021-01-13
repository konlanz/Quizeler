import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBraiN = QuizBrain();

void main() {
  runApp(QuizPage());
}

class QuizPage extends StatelessWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizLer(),
          ),
        ),
      ),
    );
  }
}

class QuizLer extends StatefulWidget {
  QuizLer({Key key}) : super(key: key);

  @override
  _QuizLerState createState() => _QuizLerState();
}

class _QuizLerState extends State<QuizLer> {
  List<Icon> scoreKepper = [];
  void checkAnswer(bool userPickedAnswwer) {
    bool corectAnswer = quizBraiN.getAnswerstoo();
    setState(() {
      if (quizBraiN.isFinished() == true) {
        Alert(
                context: context,
                title: "Finished",
                desc: "the questions are done")
            .show();
        quizBraiN.reset();
        scoreKepper = [];
      } else {
        if (corectAnswer == userPickedAnswwer) {
          scoreKepper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKepper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBraiN.nextQuetions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBraiN.getQuetin(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKepper,
        )
      ],
    );
  }
}
