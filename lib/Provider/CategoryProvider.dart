// ignore: file_names
import 'package:online_learning_app/Models/Category.dart';
import 'package:online_learning_app/Models/User.dart';

class CategoryProvider {
  CategoryProvider({
    required this.category,
  });

  List<Category>? category;

  CategoryProvider.fromJson(Map<String, dynamic> json) {
    category =
        List.from(json['body']).map((e) => Category.fromJson(e)).toList();
    print(category);
  }
}
