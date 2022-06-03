import 'package:quizzle/question.dart';

class TriviaBank {

  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(q: 'Alexander Fleming discovered penicillin.', a: true),
    Question(q: 'The black box in a plane is black.', a: false),
    Question(q: 'Harry Styles\' middle name is Edward.', a: true),
    Question(q: 'There are five different blood groups.', a: false),
    Question(q: 'There are 14 bones in a human foot.', a: false),
    Question(q: 'Meghan Markle\'s first name is Rachel.', a: true),
    Question(q: 'Coffee is made from berries.', a: true),
    Question(q: 'Google was originally called "Backrub".', a: true),
    Question(q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', a: true),
    Question(q: 'Thomas Edison discovered gravity.', a: false),

  ];

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }

  String getTriviaQuestion(){
    return _questionBank[_questionNumber].triviaQuestion;
  }

  bool getTriviaAnswer(){
    return _questionBank[_questionNumber].triviaAnswer;
  }

  bool triviaFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetTrivia(){
    _questionNumber = 0;
  }
}