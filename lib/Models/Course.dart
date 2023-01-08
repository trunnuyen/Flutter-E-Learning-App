class Course {
  String? key = DateTime.now().microsecondsSinceEpoch.toString();
  String? name = "";
  String? desc = "";
  String? price = "";
  String? imageurl = "";
  int totalEnrollments = 0;
  List<dynamic>? outcomes = [];
  String? dateAdded = "";
  List<dynamic>? requirements = [];
  String? discountedPrice = "";
  int? discountedPercent = 0;
  String? videoUrl = "";
  String? level = "";
//<editor-fold desc="Data Methods">

  Course(
      {required this.name,
      required this.desc,
      required this.price,
      required this.imageurl,
      required this.outcomes,
      required this.dateAdded,
      required this.requirements,
      required this.discountedPrice,
      required this.discountedPercent,
      required this.videoUrl,
      required this.level});

  Course.fromJson(Map<String, dynamic> json) {
    key = json["id"];
    imageurl = json['thumbnail'];
    name = json['title'];
    desc = json['shortDescription'];
    price = json['price'];
    outcomes = json['outcomes'];
    dateAdded = json['date_added'];
    requirements = json['requirements'];
    discountedPrice = json['discounted_price'];
    discountedPercent = json['discounted_percent'];
    videoUrl = json['video_url'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumbnail'] = imageurl;
    _data['title'] = name;
    _data['shortDescription'] = desc;
    _data['price'] = price;
    _data['outcomes'] = outcomes;
    _data['date_added'] = dateAdded;
    _data['requirements'] = requirements;
    _data['discounted_price'] = discountedPrice;
    _data['discounted_percent'] = discountedPercent;
    _data['video_url'] = videoUrl;
    _data['level'] = level;
    return _data;
  }

//</editor-fold>
}
