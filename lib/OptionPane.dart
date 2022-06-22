import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/controller/Questions.dart';

class OptionPane extends StatelessWidget {
  const OptionPane({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qController) {
          Color answerColor() {
            if (qController.isAnswered) {
              if (index == qController.correctAnswer) {
                return Colors.purpleAccent;
              } else if (index == qController.selecAnswer &&
                  qController.selecAnswer != qController.correctAnswer) {
                return Color.fromARGB(255, 151, 15, 15);
              }
            }
            return Colors.grey;
          }

          Icon rightIcon() {
            if (qController.isAnswered) {
              if (index == qController.correctAnswer) {
                return Icon(Icons.done);
              } else if (index == qController.selecAnswer &&
                  qController.selecAnswer != qController.correctAnswer) {
                return Icon(Icons.close);
              }
            }
            return Icon(Icons.do_not_touch_sharp);
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: answerColor(),
                border: Border.all(color: answerColor()),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}) $text",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        color: answerColor() == Colors.grey
                            ? Colors.transparent
                            : answerColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: answerColor())),
                    child: rightIcon(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
