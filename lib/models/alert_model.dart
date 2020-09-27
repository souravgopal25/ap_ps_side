import 'dart:convert';

class AlertModel {
  String title;
  String body;
  String date;
  String time;
  AlertModel({
    this.title,
    this.body,
    this.date,
    this.time,
  });

  AlertModel copyWith({
    String title,
    String body,
    String date,
    String time,
  }) {
    return AlertModel(
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'date': date,
      'time': time,
    };
  }

  factory AlertModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AlertModel(
      title: map['title'],
      body: map['body'],
      date: map['date'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlertModel.fromJson(String source) =>
      AlertModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlertModel(title: $title, body: $body, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AlertModel &&
        o.title == title &&
        o.body == body &&
        o.date == date &&
        o.time == time;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ date.hashCode ^ time.hashCode;
  }
}
