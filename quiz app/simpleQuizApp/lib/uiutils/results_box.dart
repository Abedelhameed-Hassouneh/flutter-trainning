import 'package:flutter/material.dart';
import 'package:simple_quiz_app/uiutils/single_result_box.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...summary.map((e) {
              return SingleResultBox(data: e);
            }).toList()
          ],
        ),
      ),
    );
  }
}
