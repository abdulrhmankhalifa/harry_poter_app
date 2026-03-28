import 'package:flutter/material.dart';
import 'package:harry_poter_app/constants/colors.dart';
import 'package:harry_poter_app/constants/fonts.dart';
import 'package:harry_poter_app/constants/strings.dart';
import 'package:harry_poter_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
      decoration: BoxDecoration(
        color: MyColors.characterTextColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          characterDetailsScreen,
          arguments: character,
        ),
        child: Hero(
          tag: character.id,
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: MyColors.backgroundColor,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: TextStyle(
                  color: MyColors.characterTextColor,
                  fontSize: 14,
                  fontFamily: MyFonts.sourceCodePro.fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            child: Container(
              color: MyColors.backgroundColor,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                    )
                  : Image.asset(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      'assets/images/unDownloaded.gif',
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
