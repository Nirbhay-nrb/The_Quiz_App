import 'question.dart';
import 'dart:math';

class QuizBrain {
  List<int> numbers = [];
  int _questionNumber;
  int i = 1;
  List<Question> _questionBank = [
    // adding an underscore makes the object private
    Question(
        'Entomology is the science that studies',
        'Behaviour of human beings',
        'Insects',
        'The origin and history of technical and scientific terms',
        'The formation of rocks',
        'Insects'),
    Question(
      'For which of the following disciplines is Nobel Prize awarded?',
      'Physics and Chemistry',
      'Physiology or Medicine',
      'Literature, Peace and Economics',
      'All of the above',
      'All of the above',
    ),
    Question(
      'First human heart transplant operation conducted by Dr. Christiaan Barnard on Louis Washkansky, was conducted in',
      '1967',
      '1968',
      '1958',
      '1922',
      '1967',
    ),
    Question(
      'Galileo was an Italian astronomer who',
      'developed the telescope',
      'discovered four satellites of Jupiter',
      'discovered that the movement of pendulum produces a regular time measurement',
      'All of the above',
      'All of the above',
    ),
    Question(
      'Golf player Vijay Singh belongs to which country?',
      'USA',
      'Fiji',
      'India',
      'UK',
      'Fiji',
    ),
    Question(
      'First China War was fought between',
      'China and Britain',
      'China and France',
      'China and Egypt',
      'China and Greek',
      'China and Britain',
    ),
    Question(
      'Federation Cup, World Cup, Allywyn International Trophy and Challenge Cup are awarded to winners of',
      'Tennis',
      'Volleyball',
      'Basketball',
      'Cricket',
      'Volleyball',
    ),
    Question(
      'Each year World Red Cross and Red Crescent Day is celebrated on',
      'May 8',
      'May 18',
      'June 8',
      'June 18',
      'May 8',
    ),
    Question(
      'The name of which spice comes from the French word for ‘nail’?',
      'Cinnamon',
      'Cardamom',
      'Clove',
      'Bay Leaf',
      'Clove',
    ),
    Question(
      'Who is the owner of SPACEX company?',
      'ELON MUSK',
      'NARENDARA MODI',
      'MARK HENRY',
      'RAHUL GANDHI',
      'ELON MUSK',
    ),
    Question(
      'Where was drifting originated?',
      'INDIA',
      'PAKISTAN',
      'JAPAN',
      'AMERICA',
      'JAPAN',
    ),
    Question(
      'A committee of 3 members is to be made out of 6 men and 5 women. What is the probability that the committee has at least two women?',
      '(14/37)',
      '(14/39)',
      '(14/33)',
      '(14/32)',
      '(14/33)',
    ),
    Question(
      'How many WORLD OCEANS are there on earth?',
      'Five',
      'Seven',
      'One',
      'Many',
      'One',
    ),
    Question(
      'What Color Is a Mirror?',
      'White',
      'Grey',
      'Greenish Tinge',
      'Silver',
      'Greenish Tinge',
    ),
    Question(
      '.MOV extension refers usually to what kind of file?',
      'Image File',
      'Animation/Movie file',
      'Audio File',
      'MS Office Document',
      'Animation/Movie file',
    ),
    Question(
      'Banabhatta was the court poet of which emperor?',
      'Vikramaditya',
      'Kumaragupta',
      'Harshvardhana',
      'Kanishka',
      'Harshvardhana',
    ),
    Question(
      'The title ‘Indian Napolean\' has been attached to',
      'Chandra Gupta Maurya',
      'Samudragupta',
      'Chandragupta',
      'Harshavardhana',
      'Samudragupta',
    ),
    Question(
      'Which among the following is the oldest dynasty?',
      'Maurya',
      'Gupta',
      'Kushan',
      'Kanva',
      'Maurya',
    ),
    Question(
      'Who established Mahabalipuram?',
      'Pallava',
      'Pandaya',
      'Chola',
      'Chalukya',
      'Pallava',
    ),
    Question(
      'Which is the largest internal organ in the human body?',
      'Liver',
      'Heart',
      'Lung',
      'Kidney',
      'Liver',
    ),
    Question(
      'Which planet is said to influence the way we communicate?',
      'Venus',
      'Mercury',
      'Mars',
      'Saturn',
      'Mercury',
    ),
    Question(
      'Epsom (England) is the place associated with',
      'Shooting',
      'Horse racing',
      'Polo',
      'Snooker',
      'Horse racing',
    ),
    Question(
      'The name of which spice comes from the French word for ‘nail’?',
      'Cinnamon',
      'Cardamom',
      'Clove',
      'Bay Leaf',
      'Clove',
    ),
    Question(
      'Apart from Venus, which planet rotates from east to west?',
      'Jupiter',
      'Mars',
      'Uranus',
      'Mercury',
      'Uranus',
    ),
    Question(
      'Which is the largest internal organ in the human body?',
      'Liver',
      'Heart',
      'Lung',
      'Kidney',
      'Liver',
    ),
  ];

  void nextQuestion() {
    if (i < 5) {
      _questionNumber = numbers.elementAt(i);
      i++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getOptA() {
    return _questionBank[_questionNumber].optA;
  }

  String getOptB() {
    return _questionBank[_questionNumber].optB;
  }

  String getOptC() {
    return _questionBank[_questionNumber].optC;
  }

  String getOptD() {
    return _questionBank[_questionNumber].optD;
  }

  String getQuestionAnswer() {
    return _questionBank[_questionNumber].correctAnswer;
  }

  bool isFinished() {
    if (i == 5) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    i = 1;
    numbers.clear();
  }

  void setQuestionNumber() {
    _questionNumber = numbers.elementAt(0);
  }

  void getRandomNumbers() {
    int j = 0;
    while (j < 5) {
      var randint = Random().nextInt(25);
      if (!numbers.contains(randint)) {
        numbers.add(randint);
        j++;
      } else {
        continue;
      }
    }
    print(numbers);
  }
}
