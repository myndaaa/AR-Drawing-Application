class SvgFile {
  final int? id;
  final int categoryId;
  final String filePath;

  SvgFile({this.id, required this.categoryId, required this.filePath});

  // Convert an SvgFile into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'file_path': filePath,
    };
  }

  // Extract an SvgFile object from a Map.
  factory SvgFile.fromMap(Map<String, dynamic> map) {
    return SvgFile(
      id: map['id'],
      categoryId: map['category_id'],
      filePath: map['file_path'],
    );
  }
}
