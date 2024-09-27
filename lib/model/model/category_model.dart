class PlaceCategory {
  final String id;
  final String name;
  final bool? primary;

  PlaceCategory({
    required this.id,
    required this.name,
    this.primary,
  });

  factory PlaceCategory.fromJson(Map<String, dynamic> json) {
    return PlaceCategory(
      id: json['id'],
      name: json['name'],
      primary: json['primary'],
    );
  }
}