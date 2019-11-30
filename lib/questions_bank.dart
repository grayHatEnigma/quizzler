import 'question.dart';

class QuestionBank {
  int _questionIndex = 0;
  //questions objects list
  //make it private using '_' notation to limit the access to it
  // ( encapsulation )
  static List<Question> _questions = [
    Question(question: 'الزمالك هياخد الدوري', correctAnswer: false),
    Question(question: 'الشاي فيه منه نوعين بس', correctAnswer: false),
    Question(question: 'محمد سلامة أروع واحد في العالم', correctAnswer: true),
    Question(
        question: 'لو مكنتش سلامة كنت تتمنى تكون سلامة', correctAnswer: true),
    Question(question: 'بتحب محمد سلامة', correctAnswer: true),
    Question(question: 'محمد بيحب أماني', correctAnswer: true),
  ];

  //question bank size
  int size = _questions.length;

  String nextQuestion() {
    if (_questionIndex < size - 1) {
      _questionIndex++;
      return 'continue';
    }
    return 'over';
  }

  //normal method not a getter
  String questionText() => _questions[_questionIndex].toString();

  //get correct answer
  bool correctAnswer() => _questions[_questionIndex].correctAnswer;
}
