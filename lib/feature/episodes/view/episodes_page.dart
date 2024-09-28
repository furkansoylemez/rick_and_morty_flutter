import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/entity/episode.dart';
import 'package:rick_and_morty/feature/episodes/bloc/episodes_bloc.dart';
import 'package:rick_and_morty/feature/episodes/widget/episode_list_item.dart';

final class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EpisodesBloc>(),
      child: const _EpisodesPage(),
    );
  }
}

final class _EpisodesPage extends StatefulWidget {
  const _EpisodesPage();

  @override
  State<_EpisodesPage> createState() => _EpisodesPageState();
}

final class _EpisodesPageState extends State<_EpisodesPage> {
  final PagingController<int, Episode> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    final locationsBloc = context.read<EpisodesBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      locationsBloc.add(FetchEpisodesEvent(pageKey));
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
      body: BlocListener<EpisodesBloc, EpisodesState>(
        listener: (context, state) {
          _pagingController.value = PagingState(
            nextPageKey: state.nextPageKey,
            error: state.error,
            itemList: state.itemList,
          );
        },
        child: PagedListView<int, Episode>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Episode>(
            itemBuilder: (context, item, index) => EpisodeListItem(
              episode: item,
            ),
          ),
        ),
      ),
    );
  }
}
