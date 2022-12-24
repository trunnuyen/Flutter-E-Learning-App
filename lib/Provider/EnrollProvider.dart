// ignore: file_names
import 'package:online_learning_app/Models/Enrolled.dart';

class EnrollProvider {
  EnrollProvider({
    required this.enrolls,
  });

  List<Enrolled>? enrolls;

  EnrollProvider.fromJson(Map<String, dynamic> json) {
    enrolls = List.from(json['body']).map((e) => Enrolled.fromJson(e)).toList();
  }
}
