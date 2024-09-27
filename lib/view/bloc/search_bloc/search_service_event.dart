import 'package:equatable/equatable.dart';

class SearchServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConvertLocationEvent extends SearchServiceEvent {
  final String location;
  ConvertLocationEvent(this.location);

  @override
  List<Object?> get props => [location];
}

class SearchLocationEvent extends SearchServiceEvent {
  final String key;
  SearchLocationEvent(this.key);

  @override
  List<Object?> get props => [key];
}
