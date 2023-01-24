import 'dart:convert';

import 'package:uas/model/question.dart';
import 'package:uas/repository/question_repo.dart';

class QuestionController {
  QuestionController(QuestionRepository questionRepository) {
    parseJsonQuestion(questionRepository);
  }
  List<Question> questions = [];
  void parseJsonQuestion(QuestionRepository questionRepository) {
    //Mengambil data question dari repository, lalu memformat json lalu disimpan sebagai list
    //disimpan dengan _question implementasi enkapsulasi agar data tersebut menjadi private
    var _questions = json.decode(questionRepository.questionJson) as List;
    _questions.forEach((e) {
      questions.add(Question.fromJson(e));
    });
  }
}
