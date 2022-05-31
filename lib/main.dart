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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: const Text('Quizzle'),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(flex: 5, child: Text('Questions will go here.')),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
              });
            },
            child: const Text('True'),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              const Icon(Icons.clear, color: Colors.red);
            },
            child: const Text('False'),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
