import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_app/features/home/data/datasources/property_remote_data_source.dart';

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  final FirebaseFirestore firestore;

  PropertyRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getFeaturedProperties() async {
    final snapshot = await firestore.collection('properties').get();

    return snapshot.docs.map((doc) {
      return {...doc.data(), 'id': doc.id};
    }).toList();
  }
}
