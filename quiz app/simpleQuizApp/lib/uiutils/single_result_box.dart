import 'package:flutter/material.dart';
import 'package:simple_quiz_app/uiutils/number_circled_text.dart';

class SingleResultBox extends StatelessWidget {
  const SingleResultBox({super.key, required this.data});

  final Map<String, Object> data;

  bool get isCorrect {
    return data['correct-answer'] == data['user-answer'];
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberCircledText(
            '${data['index']}',
            color: isCorrect ? Colors.green : Colors.red,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${data['question']}',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  '${data['correct-answer']}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.green),
                ),
                Text('${data['user-answer']}'),
              ],
            ),
          ),
        ],
      );
    });
  }
}
