class Survey {
  final int id;
  final String title;
  final String desc;
  final int noOfQuestions;

  Survey({this.id, this.title, this.desc, this.noOfQuestions});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        noOfQuestions: json['questions'],
    );
  }

}