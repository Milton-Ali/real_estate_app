import 'package:real_estate_app/features/home/data/datasources/property_remote_data_source.dart';

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  @override
  Future<List<Map<String, dynamic>>> getFeaturedProperties() async {
    return [
      {
        'id': 'property_1',
        'title': 'Modern Family Apartment',
        'description': 'A comfortable apartment for family living.',
        'imageUrls': [],
        'price': 8500000.0,
        'location': 'Rajshahi, Bangladesh',
        'propertyType': 'Apartment',
        'bedrooms': 3,
        'bathrooms': 2,
        'area': 1450.0,
      },
      {
        'id': 'property_2',
        'title': 'Premium City Apartment',
        'description': 'A spacious apartment in a convenient location.',
        'imageUrls': [],
        'price': 6500000.0,
        'location': 'Dhaka, Bangladesh',
        'propertyType': 'Apartment',
        'bedrooms': 2,
        'bathrooms': 2,
        'area': 1100.0,
      },
      {
        'id': 'property_3',
        'title': 'Spacious Family Home',
        'description': 'A spacious property with comfortable rooms.',
        'imageUrls': [],
        'price': 12000000.0,
        'location': 'Chattogram, Bangladesh',
        'propertyType': 'Apartment',
        'bedrooms': 4,
        'bathrooms': 3,
        'area': 1900.0,
      },
    ];
  }
}
