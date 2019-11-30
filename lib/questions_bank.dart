import 'question.dart';

class QuestionBank {
  int _questionIndex = 0;
  //questions objects list
  //make it private using '_' notation to limit the access to it
  // ( encapsulation )
  static List<Question> _questions = [
    Question('الزمالك هياخد الدوري', false),
    Question('محمد سلامة أروع واحد في العالم', true),
    Question('بعض القطط عندها حساسية من البشر', true),
    Question('لو مكنتش سلامة كنت تتمنى تكون سلامة', true),
    Question('تقريباً ربع عظام الإنسان في رجله', true),
    Question('محمد بيحب أماني', true),
    Question('غير قانوني في البرتغال إنك تعمل حمام في المحيط', true),
    Question('بتحب محمد سلامة', true),
    Question('تقدر تطبق ورقة نصين أكتر من سبع مرات', false),
    Question(
        'الشوكولاته بتأثر على القلب والجهاز العصبي عند الكلاب وقد تؤدي للوفاة',
        true),
    Question('شرب اللبن و التمر هندي مع بعض بيأثر على الجهاز المناعي', false),
    Question('محمد بيحب أماني أوي', true),
  ];

  //question bank size
  int size = _questions.length;

  String nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
      return 'continue';
    }
    return 'over';
  }

  //normal method not a getter to get a single question text
  String questionText() => _questions[_questionIndex].toString();

  //get correct answer for a certain question
  bool correctAnswer() => _questions[_questionIndex].correctAnswer;
  //reset and reshuffle question bank
  void resetQuestions() {
    _questions.shuffle();
    _questionIndex = 0;
  }
}
