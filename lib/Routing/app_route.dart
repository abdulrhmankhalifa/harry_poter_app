import 'package:harry_poter_app/constants/strings.dart';
import 'package:harry_poter_app/data/repository/characters_repository.dart';
import 'package:harry_poter_app/data/services/characters_web_services.dart';
import 'package:harry_poter_app/logic/cubit/characters_cubit.dart';
import 'package:harry_poter_app/ui/screens/character_deatils_screen.dart';
import 'package:harry_poter_app/ui/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRoute() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
    return null;
  }
}
