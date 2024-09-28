import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/di/base_module.dart';
import 'package:rick_and_morty/core/domain/entity/character.dart';
import 'package:rick_and_morty/core/router/router.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/widget/character_list_item.dart';

final class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharactersBloc>(),
      child: const _CharactersPage(),
    );
  }
}

final class _CharactersPage extends StatefulWidget {
  const _CharactersPage();

  @override
  State<_CharactersPage> createState() => _CharactersPageState();
}

final class _CharactersPageState extends State<_CharactersPage> {
  final PagingController<int, Character> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    final charactersBloc = context.read<CharactersBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      charactersBloc.add(FetchCharactersEvent(pageKey));
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
      body: BlocListener<CharactersBloc, CharactersState>(
        listener: (context, state) {
          _pagingController.value = PagingState(
            nextPageKey: state.nextPageKey,
            error: state.error,
            itemList: state.itemList,
          );
        },
        child: PagedListView<int, Character>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Character>(
            itemBuilder: (context, item, index) => CharacterListItem(
              character: item,
              onTap: () => context.go(characterDetailPath(item.id.toString())),
            ),
          ),
        ),
      ),
    );
  }
}
