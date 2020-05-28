class Answer {
  final int id;
  final String answerText;
  String value;
  final String min;
  final String max;

  Answer({this.id, this.answerText, this.value, this.min, this.max});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      answerText: json['answer'],
      value: json['value'],
      min: json['min'],
      max: json['max'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'answer': answerText,
        'value': value,
        'min': min,
        'max': max
      };

  @override
  String toString() {
    return '{ id: $id, answersText: $answerText, value: $value, min: $min, max: $max }';
  }

}