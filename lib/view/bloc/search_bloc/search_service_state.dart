import 'package:equatable/equatable.dart';
import 'package:sample_map_app/model/model/item_model.dart';
import 'package:sample_map_app/model/model/position_model.dart';

class SearchServiceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchServiceState {}

class SearchLoading extends SearchServiceState {}

class SearchLoaded extends SearchServiceState {
  final List<Item> searchResult;

  SearchLoaded(this.searchResult);
}

class ConvertLocationSuccess extends SearchServiceState {
  final Position location;

  ConvertLocationSuccess(this.location);

  @override
  List<Object?> get props => [location];
}

class SearchError extends SearchServiceState {
  final String message;

  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
