import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigationToGoogleMapEvent extends NavigationEvent {
  final LatLng endLocation;

  NavigationToGoogleMapEvent(this.endLocation);

  @override
  List<Object?> get props => [endLocation];
}
