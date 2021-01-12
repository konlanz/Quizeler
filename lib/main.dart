import 'package:flutter/material.dart';
import 'Questions.dart';

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
  List<Question> questionsBank = [
    Question(q: 'You can lead a Cow down stairs but not upstairs.', a: false),
    Question(q: 'Aproximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];
  
  int questionNumber = 0;
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
                questions[questionNumber],
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
                bool corectAnswer = answers[questionNumber];
                if (corectAnswer == true) {
                  print('the answer is true');
                } else {
                  print('the answer is false');
                }
                setState(() {
                  questionNumber++;
                  scoreKepper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
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
                bool corectAnswer = answers[questionNumber];
                if (corectAnswer == true) {
                  print('the answer is true');
                } else {
                  print('the answer is false');
                }
                setState(() {
                  questionNumber++;
                  scoreKepper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
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
