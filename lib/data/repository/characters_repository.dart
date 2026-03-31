import 'package:harry_poter_app/data/models/characters.dart';
import 'package:harry_poter_app/data/services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    try {
      final response = await charactersWebServices.getAllCharacters();

      if (response.isEmpty) {
        throw Exception('No characters found');
      }

      return response
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
