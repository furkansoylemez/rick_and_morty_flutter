import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/core/data/model/character_page_remote.dart';
import 'package:rick_and_morty/core/data/model/character_remote.dart';
import 'package:rick_and_morty/core/data/model/episode_page_remote.dart';
import 'package:rick_and_morty/core/data/model/location_page_remote.dart';

part 'rick_and_morty_service.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class RickAndMortyService {
  factory RickAndMortyService(Dio dio, {String? baseUrl}) = _RickAndMortyService;

  @GET('/character')
  Future<CharacterPageRemote> getCharacters(
    @Query('page') int page,
  );

  @GET('/character/{id}')
  Future<CharacterRemote> getCharacter(
    @Path() String id,
  );

  @GET('/location')
  Future<LocationPageRemote> getLocations(
    @Query('page') int page,
  );

  @GET('/episode')
  Future<EpisodePageRemote> getEpisodes(
    @Query('page') int page,
  );
}
