class Question {
  final int id, answer;
  final String question;
  final List<String> options;
  Question(
      {required this.id,
      required this.question,
      required this.options,
      required this.answer});
}

List data = [
  {
    "id": 1,
    "question": "'OS' computer abbreviation usually means?",
    "options": [
      'Order of Significance',
      'Open Software',
      'Operating System',
      'Optical Sensor'
    ],
    "index_of_answer": 2,
  },
  {
    "id": 2,
    "question": "'DB' computer abbreviation usually means ?",
    "options": ['Database', 'Double Byte', 'Data Block', 'Driver Boot'],
    "index_of_answer": 0,
  },
  {
    "id": 3,
    "question": "How many bits is a byte?",
    "options": ['4', '8', '16', '32'],
    "index_of_answer": 1,
  },
  {
    "id": 4,
    "question": "What's a web browser?",
    "options": [
      'A kind of spider',
      'A computer that stores WWW files',
      'A person called Bosataa',
      'A software program that allows you to access sites on the World Wide Web'
    ],
    "index_of_answer": 3,
  },
  {
    "id": 5,
    "question": "Computers calculate numbers in what mode?",
    "options": ['Decimal', 'Octal', 'Binary', 'None of the above'],
    "index_of_answer": 2,
  },
  {
    "id": 6,
    "question": "The speed of your net access is defined in terms of...",
    "options": ['RAM', 'MHz', 'Kbps', 'Megabytes'],
    "index_of_answer": 2,
  },
  {
    "id": 7,
    "question": "Who's the creator of this App",
    "options": ['Willy Wallet', 'Jerome', 'Andrews', 'Caleb'],
    "index_of_answer": 0,
  },
  {
    "id": 8,
    "question": "Google (www.google.com) is a...",
    "options": ['Number in math', 'Web Service', 'Search Engine', 'Masa, kmfd'],
    "index_of_answer": 2,
  },
  {
    "id": 9,
    "question": "Which of the following is not a programming language?",
    "options": ['Flutter', 'Python', 'Dart', 'Java'],
    "index_of_answer": 0,
  },
  {
    "id": 10,
    "question": "Flutter is the future of app development",
    "options": ['True', 'False', 'Foolish question', 'Somewhat true'],
    "index_of_answer": 0,
  },
];
