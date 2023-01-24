import 'package:flutter/material.dart';

//inheritance
class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;

  Answer({this.answerText, this.answerColor, this.answerTap});

//polimorphism
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "$answerText",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
