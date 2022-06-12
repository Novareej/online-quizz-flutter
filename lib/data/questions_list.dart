
import 'package:online_quizz/model/question.dart';

List<Question> questions = [
  Question(
    question: "How Many Whiskers does the average cat have on each side of its face ?",
    answer: {
      "1": false,
      "3": false,
      "12": true,
      "5,007": false,
    },
  ),
  Question(question: "When does a cat purr ?", answer: {
    "When it cares for its kittens": false,
    "When it needs confort": false,
    "When it feels content": false,
    "All of the above": true,
  }),
  Question(question: "What is the averge nulber of kittens in a litter ?", answer: {
    "1 to 2": false,
    "3 to 5": true,
    "8 to 10": false,
    "12 to 14": false,
  }),
  Question(question: "How many moons does Mars have ?", answer: {
    "1": false,
    "2": false,
    "4": true,
    "8": false,
  }),
  Question(question: "What is Mars's nickname ?", answer: {
    "The red planet": true,
    "The dusty planet": false,
    "The hot planet": false,
    "The smelly planet": false,
  }),
  Question(question: "About How long would it take to travel to Mars ?", answer: {
    "Three days": false,
    "A month": false,
    "Eight months": true,
    "Two years": false,
  }),
  Question(
      question: "Mars is Named after the Roman god Mars. What is he the god of ?", answer: {
    "Fire": false,
    "Love": false,
    "Agriculture": false,
    "War": true,
  }),
  Question(question: "Mars Is the ___ planet from the sun ?", answer: {
    "Secon": false,
    "Third": false,
    "Fourth": true,
    "Sixth": false,
  }),
  Question(
      question: "Where did Orville and Wilbur Wright build their first flying airplane ?",
      answer: {
        "Paris, France": false,
        "Boston, Massachusetts": false,
        "Kitty Hawk, North Carolina": true,
        "Tokyou, Japan": false,
      }),
  Question(
      question: "The First astronuts to travel to space came from which country ?", answer: {
    "United States": false,
    "Soviet Union (now Russia)": true,
    "China": false,
    "Rocketonia": false,
  }),
];
