class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShaffledAnswer() {
    final shaffledList = List.of(answers);
    shaffledList.shuffle();
    return shaffledList;
  }
}
