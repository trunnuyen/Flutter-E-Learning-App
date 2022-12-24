class Lessons {
  String key = DateTime.now().microsecondsSinceEpoch.toString();

  late String id;
  String? title;
  String? duration;
  String? courseId;
  String? videoUrl;

//<editor-fold desc="Data Methods">

  Lessons({
    required this.title,
    required this.videoUrl,
  });

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json['title'];
    duration = json['duration'];
    courseId = json['course_id'];
    videoUrl = json['video_url'];
  }

//</editor-fold>
}
