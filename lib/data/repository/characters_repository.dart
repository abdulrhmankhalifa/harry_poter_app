import 'package:harry_poter_app/data/models/characters.dart';
import 'package:harry_poter_app/data/services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((characters) => Character.fromJson(characters))
        .toList();
  }
}
