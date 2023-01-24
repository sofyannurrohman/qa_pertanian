import 'package:flutter/material.dart';
import 'package:uas/answer.dart';
import 'package:uas/controller/question_controller.dart';
import 'package:uas/model/question.dart';
import 'package:uas/repository/question_repo.dart';

//Class Home menginheritance ke StatefulWidget untuk mengambil method createState
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  //enkapsulasi menjadi  data privat agar terhindar dari akses ilegal
  int _questionIndex = 0;
  //enkapsulasi membuat data menjadi privat agar terhindar dari akses ilegal
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  var questionController;
  var questionRepository;

  List<Question> _questions;
//polimorphism mengubah implementasi dari initState()
  @override
  void initState() {
    var questionRepository = QuestionRepository();
    questionRepository.init().then((value) {
      questionController = QuestionController(questionRepository);
      //enkapsulasi membuat data menjadi privat agar terhindar dari akses ilegal
      //getter question
      _questions = questionController.questions;
      setState(() {});
    });

    super.initState();
  }

//encapsulation function
  void _questionAnswered(bool answerScore) {
    setState(() {
      //jawaban terpilih
      answerWasSelected = true;
      // checking jawaban
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // skor tracker diatas
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //logic quiz berakhir
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

//encapsulation function
  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // reset quiz ketika berakhir
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

//encapsulation function
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

/*
********************************************************************************
Overide Widget build merupakan salah satu implementasi dari OOP yaitu polymorphism
Metatag @override membantu Anda mengidentifikasi metode atau variabel bawaan yang sedang diganti di subkelas.
Dalam contoh projek ini, build() tidak mengembalikan Widget biasa. Ia mengembalikan Scaffold. Ini bekerja karena polimoryhism.
********************************************************************************
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Pertanian',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        if (_questions == null) {
          return CircularProgressIndicator();
        }
        return Center(
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    SizedBox(
                      height: 25.0,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // print private data
                child: Center(
                  child: Text(
                    "${_questions[_questionIndex].question}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // triple dot sebagai separator dari list question
              ...(_questions[_questionIndex].options).map(
                (option) => Answer(
                  answerText: option.text,
                  answerColor: answerWasSelected
                      ? option.score
                          ? Colors.green
                          : Colors.red
                      : null,
                  answerTap: () {
                    // Logic ketika jawaban dklik 2 x
                    if (answerWasSelected) {
                      return;
                    }
                    //Jawaban yang telah dipilih
                    _questionAnswered(option.score);
                  },
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50.0), backgroundColor: Colors.blue),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Pilih jawaban sebelum next question !'),
                    ));
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(
                  endOfQuiz ? 'Restart Quiz' : 'Next Question',
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                // print private data
                child: Text(
                  '${_totalScore.toString()}/${_questions.length}',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.green[300],
                      fontWeight: FontWeight.bold),
                ),
              ),
              if (answerWasSelected && !endOfQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: correctAnswerSelected ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      correctAnswerSelected
                          ? 'Selamat Kamu Benar!'
                          : 'Jawaban kamu Salah ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (endOfQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      _totalScore > 4
                          ? 'Selamat ! Kamu mendapat nilai: $_totalScore'
                          : 'Score akhir kamu: $_totalScore. Better luck next time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: _totalScore > 3
                            ? Colors.greenAccent[700]
                            : Colors.red,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
