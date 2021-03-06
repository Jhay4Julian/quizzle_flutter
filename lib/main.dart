import 'package:flutter/material.dart';
import 'package:quizzle/trivia_reserve.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade800,
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

  int finalScore(List<Icon> scoreKeeper, Icon element) {
    if  (scoreKeeper.isEmpty) {
      return 0;
    }

    int count = 0;
    for (int i = 0; i < scoreKeeper.length; i++) {
      if (scoreKeeper[i] == element) {
        count++;
      }
    }
    return count + 1;
  }

  void checkAnswer(bool userChoice) {
    bool correctAnswer = triviaBank.getTriviaAnswer();

    setState(() {
      if (triviaBank.triviaFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Your Score: ${finalScore(scoreKeeper, const Icon(Icons.check, color: Colors.green))*10}%',
          buttons: [
            DialogButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        triviaBank.resetTrivia();

        scoreKeeper = [];
      } else {
        if (userChoice == correctAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(Icons.clear, color: Colors.red));
        }
        triviaBank.getNextQuestion();
      }
    });
  }

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
                child: Text(triviaBank.getTriviaQuestion(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 27.0,
                      color: Colors.white,
                    )),
              )),
          Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
