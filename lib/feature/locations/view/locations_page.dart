import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/entity/location.dart';
import 'package:rick_and_morty/feature/locations/bloc/locations_bloc.dart';
import 'package:rick_and_morty/feature/locations/widget/location_list_item.dart';

final class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationsBloc>(),
      child: const _LocationsPage(),
    );
  }
}

final class _LocationsPage extends StatefulWidget {
  const _LocationsPage();

  @override
  State<_LocationsPage> createState() => _LocationsPageState();
}

final class _LocationsPageState extends State<_LocationsPage> {
  final PagingController<int, Location> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    final locationsBloc = context.read<LocationsBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      locationsBloc.add(FetchLocationsEvent(pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LocationsBloc, LocationsState>(
        listener: (context, state) {
          _pagingController.value = PagingState(
            nextPageKey: state.nextPageKey,
            error: state.error,
            itemList: state.itemList,
          );
        },
        child: PagedListView<int, Location>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Location>(
            itemBuilder: (context, item, index) => LocationListItem(
              location: item,
            ),
          ),
        ),
      ),
    );
  }
}
