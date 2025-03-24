import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'images/download-_2_.jpeg',
          width: 300,
        ),
        const Text(
          'Learn flutter the fun way',
          style: TextStyle(color: Color(0x8a000000), fontSize: 22),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
          icon: const Icon(Icons.arrow_right_alt_rounded),
          label: const Text('start quiz'),
        )
      ],
    ));
  }
}
