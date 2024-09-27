import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_map_app/model/internet/api_service.dart';
import 'package:sample_map_app/model/repository/search_repository.dart';
import 'package:sample_map_app/view/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_bloc.dart';
import 'package:sample_map_app/view/search/search_screen.dart';

void main() {
  final ApiService apiService = ApiService();
  final SearchRepository searchRepository = SearchRepository(apiService);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SearchServiceBloc(searchRepository)),
    BlocProvider(create: (context) => NavigationBloc()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SearchScreen(),
        ),
      ),
    );
  }
}
