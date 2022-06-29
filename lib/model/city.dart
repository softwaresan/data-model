import 'dart:convert';

class City {
  final String name;
  final String image;
  final String detail;

  City(
    this.name,
    this.image,
    this.detail,
  );

  City copyWith({
    String? name,
    String? image,
    String? detail,
  }) {
    return City(
      name ?? this.name,
      image ?? this.image,
      detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'detail': detail,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      map['name'] as String,
      map['image'] as String,
      map['detail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'City(name: $name, image: $image, detail: $detail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.name == name &&
        other.image == image &&
        other.detail == detail;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ detail.hashCode;
}
