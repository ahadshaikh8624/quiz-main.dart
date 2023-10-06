import 'dart:io';
import 'dart:math';

void main() {
  final quiz = Quiz();
  final random = Random();
  final numberOfQuestions = 20;
  final maxQuestionIndex = quiz.questions.length - 1;

  var randNums = [];
  while (randNums.length < numberOfQuestions) {
    randNums.add(random.nextInt(maxQuestionIndex + 1));
  }

  int correctAnswers = 0;

  for (int questionIndex in randNums) {
    final question = quiz.questions[questionIndex];

    print(question['question']);
    for (int i = 0; i < question['options'].length; i++) {
      print("${i + 1}. ${question['options'][i]}");
    }

    stdout.write("Your answer: ");
    final userAnswer = int.tryParse(stdin.readLineSync() ?? '');

    if (userAnswer != null && userAnswer == question['correct']) {
      print("Correct!");
      correctAnswers++;
    } else {
      print("Wrong. The correct answer is ${question['correct']}.");
    }
  }

  final percentage = (correctAnswers / numberOfQuestions) * 100;
  print("Total Correct Answers: $correctAnswers");
  print("Percentage: $percentage%");

  if (percentage > 50) {
    print("Congratulations!");
  }

  final restart = askToRestart();
  if (restart) {
    main();
  } else {
    print("Thanks for playing!");
  }
}

bool askToRestart() {
  while (true) {
    print("Do you want to restart the quiz?");
    print("1. Yes");
    print("2. No");

    stdout.write("Enter your choice: ");
    final choice = int.tryParse(stdin.readLineSync() ?? '');

    if (choice == 1) {
      return true;
    } else if (choice == 2) {
      return false;
    } else {
      print("Invalid choice. Please select 1 for Yes or 2 for No.");
    }
  }
}

class Quiz {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['London', 'Berlin', 'Madrid', 'Paris'],
      'correct': 4,
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Mars', 'Venus', 'Jupiter', 'Saturn'],
      'correct': 1,
    },
    // Add more questions here
  ];
}
