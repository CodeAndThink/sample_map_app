import 'package:bloc/bloc.dart';
import 'package:sample_map_app/view/bloc/navigation_bloc/navigation_event.dart';
import 'package:sample_map_app/view/bloc/navigation_bloc/navigation_state.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationToGoogleMapEvent>(_onNavigationToGoogleMapEvent);
  }

  Future<void> _onNavigationToGoogleMapEvent(
      NavigationToGoogleMapEvent event, Emitter<NavigationState> emit) async {
    emit(NavigationLoading());
    try {
      final url = Uri.parse(
          'https://www.google.com/maps/dir/?api=1&destination=${event.endLocation.latitude},${event.endLocation.longitude}');
      if (await launchUrl(url)) {
        await launchUrl(url);
      } else {
        throw Exception('Could not launch $url');
      }

      emit(NavigationSuccess());
    } catch (e) {
      emit(NavigationError(e.toString()));
    }
  }
}
