// ignore: file_names
import 'package:online_learning_app/Models/Lessons.dart';

class LessonsProvider {
  LessonsProvider({
    required this.lessons,
  });

  List<Lessons>? lessons;

  LessonsProvider.fromJson(Map<String, dynamic> json) {
    lessons = List.from(json['body']).map((e) => Lessons.fromJson(e)).toList();
  }
}
