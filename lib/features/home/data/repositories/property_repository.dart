import 'package:real_estate_app/features/home/domain/entities/property_entity.dart';

abstract class PropertyRepository {
  Future<List<PropertyEntity>> getFeaturedProperties();
}
