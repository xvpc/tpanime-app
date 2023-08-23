import 'package:flutter/material.dart';
import 'package:tpanime/components/modals/fullscreen.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/hooks/capitalize.dart';
import 'package:tpanime/models/collection/colors.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:tpanime/models/types.dart';

class CharacterPage extends StatelessWidget {
  final characterTypes character;
  // final Map<String, dynamic> character;
  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              character.name?["userPreferred"] != null
                  ? "${character.name?["userPreferred"]}"
                  : character.name?["full"] != null
                      ? "${character.name?["full"]}"
                      : "Unknown",
              maxLines: 1,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            elevation: 2,
            shadowColor: Colors.white),
        body: Container(
            // width: Dimensions.screenWidth,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenSize3, vertical: 40),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior()
                  .copyWith(physics: const ClampingScrollPhysics()),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FullScreenImage(image: '${character.image}'),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenSize4),
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // height: 100,
                            child: character.image != null
                                ? FadeInImage.assetNetwork(
                                    fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                    placeholder: placeholderImage,
                                    image: '${character.image}',
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    backupImage,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            character.name?["userPreferred"] != null
                                ? "${character.name?["userPreferred"]}"
                                : character.name?["full"] != null
                                    ? "${character.name?["full"]}"
                                    : "Unknown",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          character.role != null
                              ? Text("${capitalize(character.role)}",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.fontSize))
                              : const SizedBox(
                                  height: 0,
                                )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  character.voiceActors!.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Voice actors ",
                                style: TextStyle(
                                    color: AppColors.overlay,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.fontWeight)),
                            const SizedBox(
                              height: 15,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                  children: List.generate(
                                      character.voiceActors?.length ?? 0,
                                      (index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    color: Colors.white10,
                                    // width: 200,
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        character.voiceActors![index]
                                                    ["image"] !=
                                                null
                                            ? FadeInImage.assetNetwork(
                                                fadeInCurve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                placeholder: placeholderImage,
                                                image:
                                                    '${character.voiceActors?[index]["image"]}',
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                backupImage,
                                                fit: BoxFit.cover,
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60, left: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                character.voiceActors![index]
                                                                ["name"]
                                                            ["userPreferred"] !=
                                                        null
                                                    ? "${character.voiceActors?[index]["name"]["userPreferred"]}"
                                                    : character.voiceActors![
                                                                        index]
                                                                    ["name"]
                                                                ["full"] !=
                                                            null
                                                        ? "${character.voiceActors?[index]["name"]["full"]}"
                                                        : "Unknown",
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.color,
                                                  fontSize: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.fontSize,
                                                  fontWeight: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.fontWeight,
                                                  overflow: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.overflow,
                                                ),
                                              ),
                                              Text(
                                                  character.voiceActors![index]
                                                              ["language"] !=
                                                          null
                                                      ? "${character.voiceActors?[index]["language"]}"
                                                      : " ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleSmall
                                                              ?.fontSize,
                                                      fontWeight:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleMedium
                                                              ?.fontWeight))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })),
                            )
                          ],
                        )
                      : const SizedBox(height: 0),
                ],
              ),
            )));
  }
}
