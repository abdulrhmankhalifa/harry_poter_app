import 'package:flutter/material.dart';
import 'package:harry_poter_app/constants/colors.dart';
import 'package:harry_poter_app/constants/fonts.dart';
import 'package:harry_poter_app/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          buildAppBarSilvers(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                padding: EdgeInsets.all(10),
                child: buildAllDataItem(),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildAppBarSilvers() {
    return SliverAppBar(
      leading: BackButton(color: MyColors.characterTextColor),
      backgroundColor: MyColors.backgroundColor,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          textAlign: TextAlign.center,

          style: MyFonts.sourceCodeProBold.copyWith(
            color: MyColors.characterTextColor,
            fontSize: 18,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget buildDataItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: MyFonts.sourceCodeProBold.copyWith(
                color: MyColors.characterTextColor,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: value,
              style: MyFonts.sourceCodePro.copyWith(
                color: MyColors.characterTextColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDvideer() {
    return Divider(height: 2, thickness: 2, color: MyColors.characterTextColor);
  }

  Widget buildAllDataItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDataItem(
          'Alternate Names : ',
          '${character.alternateNames.join(' / ')}.',
        ),
        buildDvideer(),
        buildDataItem('House : ', character.house),
        buildDvideer(),
        buildDataItem('Species : ', character.species),
        buildDvideer(),
        buildDataItem('Gender : ', character.gender),
        buildDvideer(),
        buildDataItem('Date Of Birth : ', character.dateOfBirth),
        buildDvideer(),
        buildDataItem('Wizard : ', character.wizard ? 'Yes' : 'No'),
        buildDvideer(),
        buildDataItem('Ancestry : ', character.ancestry),
        buildDvideer(),
        buildDataItem(
          'Wand : ',
          '${character.wand.wood} / ${character.wand.core} / ${character.wand.length}',
        ),
        buildDvideer(),
        buildDataItem(
          'Hogwarts Student : ',
          character.hogwartsStudent ? 'Yes' : 'No',
        ),
        buildDvideer(),
        buildDataItem(
          'Hogwarts Staff : ',
          character.hogwartsStaff ? 'Yes' : 'No',
        ),
        buildDvideer(),
        buildDataItem('Alive : ', character.isAlive ? 'Yes' : 'No'),
        buildDvideer(),
        buildDataItem(
          'patronus : ',
          character.patronus.isEmpty
              ? 'Dont\'t have a patrouns'
              : character.patronus,
        ),
        buildDvideer(),
        buildDataItem('Actor Name : ', character.actor),
        buildDvideer(),
        SizedBox(height: 20),
      ],
    );
  }
}
