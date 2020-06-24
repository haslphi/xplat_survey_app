class Survey {
  final int id;
  final String title;
  final String description;
  final int noOfQuestions;
  bool isLocal = false; /// used to mark this survey as retrieved from asset storage

  Survey({this.id, this.title, this.description, this.noOfQuestions});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
        id: json['id'],
        title: json['title'],
        description: json['desc'],
        noOfQuestions: json['questions'],
    );
  }

}