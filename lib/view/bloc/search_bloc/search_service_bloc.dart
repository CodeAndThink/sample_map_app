import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sample_map_app/model/repository/search_repository.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_event.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_state.dart';

class SearchServiceBloc extends Bloc<SearchServiceEvent, SearchServiceState> {
  final SearchRepository _searchRepository;
  SearchServiceBloc(this._searchRepository) : super(SearchInitial()) {
    on<SearchLocationEvent>(_onSearchLocationEvent);
    on<ConvertLocationEvent>(_onConvertLocationEvent);
  }

  Future<void> _onSearchLocationEvent(
      SearchLocationEvent event, Emitter<SearchServiceState> emit) async {
    emit(SearchLoading());
    try {
      final listLocation = await _searchRepository.searchLocation(event.key);
      emit(SearchLoaded(listLocation));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> _onConvertLocationEvent(
      ConvertLocationEvent event, Emitter<SearchServiceState> emit) async {
    try {
      final listLocation = await _searchRepository.searchDetailLocation(event.location);
      final position = listLocation.position;
      emit(ConvertLocationSuccess(position));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
