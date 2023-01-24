import 'package:flutter/services.dart';

// Membuat class yang mengambil questions.json / getter dari localdata
class QuestionRepository {
  String questionJson;
  Future init() async {
    questionJson = await rootBundle.loadString('assets/questions.json');
  }
}
