import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final questionIndex = data['question_index'] as int;
        final questionText = data['question'] as String;
        final correctAnswer = data['correct_answer'] as String;
        final userAnswer = data['user_answer'] as String;

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey, width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Box for question number
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${questionIndex + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Question and answers
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Your Answer: $userAnswer',
                      style: TextStyle(
                        fontSize: 14,
                        color: userAnswer == correctAnswer
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    Text(
                      'Correct Answer: $correctAnswer',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
