import 'package:real_estate_app/features/home/domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrls,
    required super.price,
    required super.location,
    required super.propertyType,
    required super.bedrooms,
    required super.bathrooms,
    required super.area,
  });
  factory PropertyModel.fromMap(
    Map<String, dynamic> map, {
    required String id,
  }) {
    return PropertyModel(
      id: id,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      imageUrls:
          (map['imageUrls'] as List<dynamic>?)?.whereType<String>().toList() ??
          [],
      price: (map['price'] as num?)?.toDouble() ?? 0,
      location: map['location'] as String? ?? '',
      propertyType: map['propertyType'] as String? ?? '',
      bedrooms: (map['bedrooms'] as num?)?.toInt() ?? 0,
      bathrooms: (map['bathrooms'] as num?)?.toInt() ?? 0,
      area: (map['area'] as num?)?.toDouble() ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'price': price,
      'location': location,
      'propertyType': propertyType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
    };
  }
}
