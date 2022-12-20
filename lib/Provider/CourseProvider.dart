// ignore: file_names

import 'package:online_learning_app/Models/Course.dart';

class CourseProvider {
  CourseProvider({
    required this.courses,
  });

  List<Course>? courses;
  int? length = 0;

  CourseProvider.fromJson(Map<String, dynamic> json) {
    courses = List.from(json['body']).map((e) => Course.fromJson(e)).toList();
    length = json['itemCount'] as int;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['body'] = courses!.map((e) => e.toJson()).toList();
    return _data;
  }
}
