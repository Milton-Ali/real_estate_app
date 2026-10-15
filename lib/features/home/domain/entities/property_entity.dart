class PropertyEntity {
  const PropertyEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.location,
    required this.propertyType,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
  });

  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final String location;
  final String propertyType;
  final int bedrooms;
  final int bathrooms;
  final double area;
}
