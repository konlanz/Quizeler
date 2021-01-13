import 'Questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionsBank = [
    Question(q: 'You can lead a Cow down stairs but not upstairs.', a: false),
    Question(
        q: 'Aproximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];

  void nextQuetions() {
    if (_questionNumber <= _questionsBank.length - 1) {
      _questionNumber++;
    }else{
      _questionNumber = 0;
    }
  }

  String getQuetin() {
    return _questionsBank[_questionNumber].questionText;
  }

  bool getAnswerstoo() {
    return _questionsBank[_questionNumber].questionAnswer;
  }
}
