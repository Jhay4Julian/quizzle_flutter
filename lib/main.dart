import 'package:flutter/material.dart';
import 'package:quizzle/trivia_reserve.dart';

TriviaBank triviaBank = TriviaBank();

void main() {
  runApp(const Quizzle());
}

class Quizzle extends StatelessWidget {
  const Quizzle({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quizzle',
        home: Scaffold(
          backgroundColor: Colors.grey.shade800,
          appBar: AppBar(
            title: const Center(child: Text('Quizzle')),
          ),
          body: const QuizPage(),
        ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                triviaBank.getTriviaQuestion(questionNumber),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 27.0,
                  color: Colors.white,
                )
                ),
            )),
          Expanded(
            child: TextButton(
              onPressed: () {

                bool correctAnswer = triviaBank.questionBank[questionNumber].triviaAnswer;

                if (correctAnswer == true) {
                  setState(() {
                  scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                  questionNumber++;
                });
                } else {
                  setState(() {
                  scoreKeeper.add(const Icon(Icons.clear, color: Colors.red));
                  questionNumber++;
                });
                }
              },
              child: const Text(
                'True',
                style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing: 1.5),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TextButton(
              onPressed: () {

                bool correctAnswer = triviaBank.questionBank[questionNumber].triviaAnswer;

                if (correctAnswer == false) {
                  setState(() {
                  scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                  questionNumber++;
                });
                } else {
                  setState(() {
                  scoreKeeper.add(const Icon(Icons.clear, color: Colors.red));
                  questionNumber++;
                });
                }
              },
              child: const Text(
                'False',
                style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing: 1.5),  
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
