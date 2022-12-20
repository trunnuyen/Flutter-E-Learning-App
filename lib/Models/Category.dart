class Category {
  Category({
    required this.id,
    required this.thumbnail,
    required this.name,
  });

  late String id;
  String? thumbnail;
  String? name;

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    thumbnail = json['thumbnail'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['thumbnail'] = thumbnail;
    _data['title'] = name;
    return _data;
  }
}
