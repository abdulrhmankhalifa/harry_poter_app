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
  late List<Character> searchedCharacters;
  final searchTextController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        leading: isSearching
            ? const BackButton(color: MyColors.characterTextColor)
            : null,
        backgroundColor: MyColors.backgroundColor,
        title: isSearching
            ? buildAppBarSearchField()
            : buildDefaultAppBarTitle(),
        actions: buildAppBarActions(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: MyColors.characterTextColor,
            thickness: 2,
            indent: 8,
            endIndent: 8,
          ),
        ),
      ),

      body: buildCharactersWidget(),
    );
  }

  //no internet widget
  Widget noInternetWidget() {
    return Center(
      child: Container(
        color: MyColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'No Internet Connection',
              style: MyFonts.sourceCodeProBold.copyWith(
                color: MyColors.characterTextColor,
                fontSize: 18,
              ),
            ),
            Image.asset(
              'harry_poter_app/assets/images/No Internet Connection.gif',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  //characters Widgets
  Widget buildCharactersWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return loadedCharacterWidget();
        } else if (state is CharactersError) {
          return errorWidget(state.message);
        } else if (state is CharactersLoading) {
          return loadingCharactersWidget();
        } else {
          return loadingCharactersWidget();
        }
      },
    );
  }

  Widget errorWidget(String message) {
    return Center(
      child: Container(
        color: MyColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 60),
            SizedBox(height: 20),
            Text(
              'Oops! Something went wrong',
              style: MyFonts.sourceCodeProBold.copyWith(
                color: MyColors.characterTextColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: MyFonts.sourceCodePro.copyWith(
                  color: MyColors.characterTextColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<CharactersCubit>(context).getAllCharacters();
              },
              icon: Icon(Icons.refresh),
              label: Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.characterTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingCharactersWidget() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.characterTextColor),
    );
  }

  Widget loadedCharacterWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.backgroundColor,
        child: Column(children: [buildCharactersList()]),
      ),
    );
  }

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
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedCharacters.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedCharacters[index],
        );
      },
    );
  }

  // Search Widgets
  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where(
          (character) => character.name.toLowerCase().startsWith(
            searchedCharacter.toLowerCase(),
          ),
        )
        .toList();
    setState(() {});
  }

  void startSearching() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  // appBar Widgets
  Widget buildDefaultAppBarTitle() {
    return Text(
      'Characters',
      style: MyFonts.sourceCodeProBold.copyWith(
        color: MyColors.characterTextColor,
        fontSize: 24,
      ),
    );
  }

  Widget buildAppBarSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.characterTextColor,
      decoration: InputDecoration(
        hintText: 'Search For A Character',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.characterTextColor, fontSize: 18),
      ),
      style: MyFonts.sourceCodeProBold.copyWith(
        color: MyColors.characterTextColor,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.characterTextColor),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search, color: MyColors.characterTextColor),
        ),
      ];
    }
  }
}
