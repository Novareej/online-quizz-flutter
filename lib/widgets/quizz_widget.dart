import 'package:flutter/material.dart';
import 'package:online_quizz/model/question.dart';
import 'package:online_quizz/ui/shared/color.dart';

Widget questionWidget(
    Question question, void Function() function, bool pressed) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Text(
          "${question.question}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ),
      for (int i = 0; i < question.answer!.length; i++)
        Container(
          width: double.infinity,
          height: 50.0,
          margin: EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fillColor: AppColor.secondaryColor,
            onPressed: function,
            child: Text(question.answer!.keys.toList()[i]),
          ),
        )
    ],
  );
}
