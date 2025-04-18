class TrailerModel {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;

  TrailerModel({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.type,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      key: json['key'] ?? '',
      site: json['site'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
