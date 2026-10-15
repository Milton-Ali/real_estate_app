import 'package:real_estate_app/features/home/data/datasources/property_remote_data_source.dart';
import 'package:real_estate_app/features/home/data/models/property_model.dart';
import 'package:real_estate_app/features/home/data/repositories/property_repository.dart';
import 'package:real_estate_app/features/home/domain/entities/property_entity.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  const PropertyRepositoryImpl(this.remoteDataSource);
  final PropertyRemoteDataSource remoteDataSource;
  @override
  Future<List<PropertyEntity>> getFeaturedProperties() async {
    final propertyMaps = await remoteDataSource.getFeaturedProperties();
    return propertyMaps
        .map(
          (map) => PropertyModel.fromMap(map, id: map['id'] as String? ?? ''),
        )
        .toList();
  }
}
