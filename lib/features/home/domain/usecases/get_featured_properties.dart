import 'package:real_estate_app/features/home/data/repositories/property_repository.dart';
import 'package:real_estate_app/features/home/domain/entities/property_entity.dart';

class GetFeaturedProperties {
  const GetFeaturedProperties(this.repository);

  final PropertyRepository repository;

  Future<List<PropertyEntity>> call() {
    return repository.getFeaturedProperties();
  }
}
