// ignore: file_names
import 'package:online_learning_app/Models/User.dart';

class UserProvider {
  UserProvider({
    required this.user,
  });

  List<Users>? user;

  UserProvider.fromJson(Map<String, dynamic> json) {
    user = List.from(json['body']).map((e) => Users.fromJson(e)).toList();
    print(user);
  }
}
