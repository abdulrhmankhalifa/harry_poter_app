import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_poter_app/data/models/characters.dart';
import 'package:harry_poter_app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    try {
      final fetchedCharacters = await charactersRepository.getAllCharacters();
      characters = fetchedCharacters;
      emit(CharactersLoaded(fetchedCharacters));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
