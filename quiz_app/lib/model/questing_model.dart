class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final questions = [
  Question(
    text: 'Which planet in our solar system is know as the red planet',
    options: [
      Option(text: 'Alexander Fleming', isCorrect: false),
      Option(text: 'Alexander Graham Bell', isCorrect: false),
      Option(text: 'Thomas Alva Edison', isCorrect: false),
      Option(text: 'Mars', isCorrect: true),
    ],
  ),

  Question(
    text: 'Who invented the light bulb',
    options: [
      Option(text: 'Mars', isCorrect: false),
      Option(text: 'Thomas Alva Edison', isCorrect: true),
      Option(text: 'Jupiter', isCorrect: false),
      Option(text: 'Alexander Graham Bell', isCorrect: false),
    ],
  ),
  Question(
    text: 'Who discovered penicillin',
    options: [
      Option(text: 'Alexander Graham Bell', isCorrect: false),
      Option(text: 'Alexander Fleming', isCorrect: true),
      Option(text: 'Thomas Alva Edison', isCorrect: false),
      Option(text: 'Jupiter', isCorrect: false),
    ],
  ),
];

