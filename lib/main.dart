import 'package:flutter/material.dart';
import 'Quiz.dart';

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
  //question index
  int qIndex = 0;
  //questions objects list
  List<Quiz> questions = [
    Quiz(question: 'الزمالك هياخد الدوري', correctAnswer: false),
    Quiz(question: 'الشاي فيه منه نوعين بس', correctAnswer: false),
    Quiz(question: 'محمد سلامة أروع واحد في العالم', correctAnswer: true),
    Quiz(question: 'لو مكنتش سلامة كنت تتمنى تكون سلامة', correctAnswer: true),
    Quiz(question: 'بتحب محمد سلامة', correctAnswer: true),
    Quiz(question: 'محمد بيحب أماني', correctAnswer: true),
  ];
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
                questions[qIndex].toString(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontFamily: 'Harmattan', color: Colors.white, fontSize: 30),
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
          child: Row(
            children: scoreBar,
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
                fontFamily: 'Tajawal', color: Colors.white, fontSize: 20),
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
                fontFamily: 'Tajawal', color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            print('red button pressed');
            //check answer
            check(false); // red == false
            update();
          },
        ),
      ],
    );
  } //buttonCreator

// method to check user answer
  void check(bool buttonClicked) {
    if (questions[qIndex].correctAnswer == buttonClicked) {
      print('Correct!');
      scoreBar.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      print('Wrong!');
      scoreBar.add(Icon(
        Icons.clear,
        color: Colors.red[500],
      ));
    }
  } //check

//method to update UI
  void update() {
    setState(() {
      if (qIndex < questions.length - 1) {
        qIndex += 1;
      } else {
        qIndex = 0;
        scoreBar.clear();
      }
    });
  } //updateScore

///////////////////// THE END //////////////////////////
} // Class End.
