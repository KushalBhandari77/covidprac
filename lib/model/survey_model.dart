class Questions {
  final int number;
  final String title;
  final String subtitle;
  final String question;
  bool isYes;

  Questions(
      {this.number,
      this.title,
      this.subtitle,
      this.question,
      this.isYes = false});
}

List<Questions> questionList = [
  Questions(
      number: 1,
      title: "Before we start",
      subtitle: "Let's take a Survey",
      question: "Do you have any problem while breathing from some days?"),
  Questions(
      number: 2,
      title: "We are halfway",
      subtitle: "Keep on answering",
      question: "Do you have Fever?"),
  Questions(
      number: 3,
      title: "Final one",
      subtitle: "Thank you for answering",
      question:
          "Are you getting taste or smell of anything you taste or smell?"),
];
