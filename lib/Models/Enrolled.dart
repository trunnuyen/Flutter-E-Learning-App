import '../Repository/DBHelper.dart';

class Enrolled {
  String userkey = DBHelper.auth.currentUser!.uid;
  String? sqlId;
  String? sqlUserId;
  String coursekey = "";

//<editor-fold desc="Data Methods">

  Enrolled({required this.coursekey, this.sqlId, this.sqlUserId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enrolled &&
          runtimeType == other.runtimeType &&
          userkey == other.userkey &&
          coursekey == other.coursekey);

  @override
  int get hashCode => userkey.hashCode ^ coursekey.hashCode;

  @override
  String toString() {
    return 'Enrolled{' +
        ' userkey: $userkey,' +
        ' coursekey: $coursekey,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'userkey': this.userkey,
      'coursekey': this.coursekey,
    };
  }

  factory Enrolled.fromJson(Map<String, dynamic> json) {
    return Enrolled(
        coursekey: json['course_id'],
        sqlId: json['id'],
        sqlUserId: json['user_id']);
  }

//</editor-fold>
}
