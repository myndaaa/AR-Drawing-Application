class Category {
  final int? id;
  final String name;
  final String thumbnail;

  Category({this.id, required this.name, required this.thumbnail});

  // Convert a Category into map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
    };
  }

  // Extract
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      thumbnail: map['thumbnail'],
    );
  }
}