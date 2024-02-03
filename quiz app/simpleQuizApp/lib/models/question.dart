class Question {
  const Question(this.title, this.answers);

  final String title;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final list = answers.toList();
    list.shuffle();
    return list;
  }
}
