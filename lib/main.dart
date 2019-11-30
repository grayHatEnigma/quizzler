import 'package:flutter/material.dart';
import 'package:quizzler/questions_bank.dart';
import 'question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Silly Quizzler',
            style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: 'Vibes',
                letterSpacing: 4),
          ),
        ),
        body: QuizPage(),
      ),
    );
  } // build
} // MyApp

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  /*
   * Variables
   */
  int correctAnswersCounter = 0;
  int wrongAnswersCounter = 0;
  String state = 'start';
  //create a question bank object
  QuestionBank questionBank = QuestionBank();
  // score bar icons list
  List<Icon> scoreBar = [];

  /*
   * Methods
   */

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                textToDisplay(state),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontFamily: 'Harmattan', color: Colors.white, fontSize: 35),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: buttonsCreator(),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: scoreBar,
            ),
          ),
        ),
      ],
    );
  } //build

// method that creates 2 buttons in a column
  Column buttonsCreator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
          color: Colors.green,
          child: Text(
            'صحيح',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Tajawal', color: Colors.white, fontSize: 22),
          ),
          onPressed: () {
            check(true); // green == true
            update();
          },
        ),
        FlatButton(
          color: Colors.red,
          child: Text(
            'خطأ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Tajawal', color: Colors.white, fontSize: 22),
          ),
          onPressed: () {
            check(false); // red == false
            update();
          },
        ),
      ],
    );
  } //buttonCreator

// method to check user answer
  void check(bool buttonClicked) {
    if (state != 'over') {
      if (questionBank.correctAnswer() == buttonClicked) {
        scoreBar.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        correctAnswersCounter++;
      } else {
        scoreBar.add(
          Icon(
            Icons.clear,
            color: Colors.red[500],
          ),
        );
        wrongAnswersCounter++;
      }
    }
  } //check

//method to update UI
  void update() {
    setState(() {
      state = questionBank.nextQuestion();
    });
  } //updateScore

  String textToDisplay(state) {
    if (state == 'over') {
      return "Score\n$correctAnswersCounter / ${questionBank.size}";
    } else
      return questionBank.questionText().toString();
  }
///////////////////// THE END //////////////////////////
} // Class End.
