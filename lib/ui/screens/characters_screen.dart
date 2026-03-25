import 'package:harry_poter_app/constants/colors.dart';
import 'package:harry_poter_app/constants/fonts.dart';
import 'package:harry_poter_app/data/models/characters.dart';
import 'package:harry_poter_app/logic/cubit/characters_cubit.dart';
import 'package:harry_poter_app/ui/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(
      context,
    ).getAllCharacters();
  }

  //بتعرض الاب بار بتاع الشاشه
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.backgroundColor,
      title: Text(
        'Characters',
        style: MyFonts.sourceCodeProBold.copyWith(
          color: MyColors.characterTextColor,
          fontSize: 24,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Divider(
          color: MyColors.characterTextColor,
          thickness: 2,
          indent: 8,
          endIndent: 8,
        ),
      ),
    );
  }

  //فيها البلوك بيتبني والاحتمالات بتاعته
  Widget buildCharactersWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return loadedCharacterWidget();
        } else {
          return loadingCharactersWidget();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: buildAppBar(),
      body: buildCharactersWidget(),
    );
  }

  //بتحمل لغايت ما الدااتا بتاعت الكركتيرز تحمل
  Widget loadingCharactersWidget() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.characterTextColor),
    );
  }

  //فيها الليست بتاعت الكركتيرز اللي بتتعرض في الشاشه
  Widget loadedCharacterWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.backgroundColor,
        child: Column(children: [buildCharactersList()]),
      ),
    );
  }

  //بتعرض الدااتا بتاعت الكركتيرز
  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allCharacters.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(character: allCharacters[index]);
      },
    );
  }
}
