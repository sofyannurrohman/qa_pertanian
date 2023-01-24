//membuat model dari option atau pilihan jawaban
class Options {
  String text;
  bool score;

  Options({this.text, this.score});

  Options.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['text'] = this.text;
    data['score'] = this.score;
    return data;
  }
}
