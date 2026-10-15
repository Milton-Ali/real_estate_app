import 'package:equatable/equatable.dart';
import 'package:real_estate_app/features/home/domain/entities/property_entity.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();
  @override
  List<Object?> get props => [];

  get properties => null;
}

class PropertyInitial extends PropertyState {
  const PropertyInitial();
}

class PropertyLoading extends PropertyState {
  const PropertyLoading();
}

class PropertyLoaded extends PropertyState {
  const PropertyLoaded(this.properties);

  final List<PropertyEntity> properties;

  @override
  List<Object?> get props => [properties];
}

class PropertyError extends PropertyState {
  const PropertyError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
