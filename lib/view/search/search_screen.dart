import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_map_app/view/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:sample_map_app/view/bloc/navigation_bloc/navigation_event.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_bloc.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_event.dart';
import 'package:sample_map_app/view/bloc/search_bloc/search_service_state.dart';
import 'package:sample_map_app/view/search/item/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool loadingState = false;
  Timer? _debounce;

  //Clear the search box
  void clearSearch() {
    _searchController.clear();
    setState(() {});
  }

  //Open google map
  void openGoogleMap(LatLng position) {
    context.read<NavigationBloc>().add(NavigationToGoogleMapEvent(position));
  }

  //Get detail position
  void getPlacePostion(String place) {
    context.read<SearchServiceBloc>().add(ConvertLocationEvent(place));
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }

  //Search action
  void searchAction(String keyword) {
    context.read<SearchServiceBloc>().add(SearchLocationEvent(keyword));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Enter keyword...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1,
                ),
              ),
              prefixIcon: loadingState == false
                  ? const Icon(
                      Icons.search,
                      size: 18,
                    )
                  : Container(
                      height: 10,
                      width: 10,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear_sharp,
                        size: 18,
                      ),
                      onPressed: () {
                        _searchController.clear();
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 1000), () {
                if (value.isNotEmpty) {
                  searchAction(value);
                }
              });
            },
          ),
          Expanded(
              child: BlocConsumer<SearchServiceBloc, SearchServiceState>(
                  listener: (context, state) {
            if (state is ConvertLocationSuccess) {
              final position = LatLng(state.location.lat, state.location.lng);
              openGoogleMap(position);
            } else if (state is SearchLoading) {
              setState(() {
                loadingState = true;
              });
            } else if (state is SearchError) {
              setState(() {
                loadingState = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Error ${state.message}'),
                duration: const Duration(seconds: 2),
              ));
            } else {
              setState(() {
                loadingState = false;
              });
            }
          }, builder: (context, state) {
            if (state is SearchLoaded) {
              final listLocation = state.searchResult;
              return ListView.builder(
                  itemCount: listLocation.length,
                  itemBuilder: (context, index) {
                    return SearchItem(
                      onTap: () =>
                          getPlacePostion(listLocation[index].address.label),
                      location: listLocation[index],
                    );
                  });
            } else if (state is SearchError) {
              return Container();
            } else {
              return Container();
            }
          })),
        ],
      ),
    ));
  }
}
