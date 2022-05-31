import 'package:flutter/material.dart';

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

  List<String> triviaQuestions = [
    'Alexander Fleming discovered penicillin.',
    'Harry Styles\' middle name is Edward.',
    'There are five different blood groups.',
    'There are 14 bones in a human foot.',
    'Meghan Markle\'s first name is Rachel.',
    'Coffee is made from berries.',
    'The black box in a plane is black.',
  ];

  List<bool> triviaAnswers = [
    true,
    true,
    false,
    false,
    true,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 6,
            child: Center(
              child: Text(
                'Questions will go here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27.0,
                  color: Colors.white,
                )
                ),
            )),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                });
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
                setState(() {
                  const Icon(Icons.clear, color: Colors.red);
                });
              },
              child: const Text(
                'False',
                style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing: 1.5),  
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
