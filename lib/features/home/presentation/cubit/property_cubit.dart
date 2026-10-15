import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/features/home/domain/usecases/get_featured_properties.dart';
import 'package:real_estate_app/features/home/presentation/cubit/property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit(this.getFeaturedProperties) : super(PropertyInitial());
  final GetFeaturedProperties getFeaturedProperties;
  Future<void> loadFeaturedProperties() async {
    emit(const PropertyLoading());
    try {
      final properties = await getFeaturedProperties();
      emit(PropertyLoaded(properties));
    } catch (e) {
      emit(PropertyError(e.toString()));
    }
  }
}
