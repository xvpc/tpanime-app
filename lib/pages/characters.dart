import 'package:flutter/material.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/hooks/capitalize.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:tpanime/models/types.dart';

class CharacterPage extends StatelessWidget {
  final characterTypes character;
  // final Map<String, dynamic> character;
  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            width: Dimensions.screenWidth,
            padding: EdgeInsets.all(Dimensions.screenSize1),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior()
                  .copyWith(physics: const ClampingScrollPhysics()),
              child: ListView(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.screenSize4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              character.role != null
                                  ? Row(
                                      children: [
                                        Text("Role: ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.fontSize)),
                                        Text(
                                          "${capitalize(character.role)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    )
                                  : const SizedBox(
                                      width: 0,
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              character.name?["userPreferred"] != null
                                  ? Row(
                                      children: [
                                        Text("Character: ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.fontSize)),
                                        Text(
                                          "${character.name?["userPreferred"]}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    )
                                  : character.name?["full"] != null
                                      ? Row(
                                          children: [
                                            Text("Character: ",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.fontSize)),
                                            Text(
                                              "${character.name?["full"]}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            )
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Text("Character: ",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.fontSize)),
                                            Text(
                                              "Unknown",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            )
                                          ],
                                        ),
                              const SizedBox(
                                height: 10,
                              ),
                              (character.voiceActors?.isNotEmpty) ??
                                      character.voiceActors!.length > 0
                                  ? character.voiceActors![0]["name"]
                                              ["userPreferred"] !=
                                          null
                                      ? Row(
                                          children: [
                                            Text("Voice actor: ",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.fontSize)),
                                            Text(
                                              "${character.voiceActors?[0]["name"]["userPreferred"]}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            )
                                          ],
                                        )
                                      : character.voiceActors![0]["name"]
                                                  ["full"] !=
                                              null
                                          ? Row(
                                              children: [
                                                Text("Voice actor: ",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.fontSize)),
                                                Text(
                                                  "${character.voiceActors?[0]["name"]["full"]}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Text("Voice actor: ",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.fontSize)),
                                                Text(
                                                  "Unknown",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                )
                                              ],
                                            )
                                  : const SizedBox(
                                      width: 0,
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Dimensions.screenHeight / 4.4,
                                child: Row(
                                  children: [
                                    character.image != null
                                        ? FadeInImage.assetNetwork(
                                            fadeInCurve:
                                                Curves.fastLinearToSlowEaseIn,
                                            placeholder: placeholderImage,
                                            image: '${character.image}',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            backupImage,
                                            fit: BoxFit.cover,
                                          ),
                                    SizedBox(width: Dimensions.screenSize3),
                                    (character.voiceActors!.length > 0 &&
                                            character.voiceActors![0]
                                                    ["image"] !=
                                                null)
                                        ? FadeInImage.assetNetwork(
                                            fadeInCurve:
                                                Curves.fastLinearToSlowEaseIn,
                                            placeholder: placeholderImage,
                                            image:
                                                '${character.voiceActors?[0]["image"]}',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            backupImage,
                                            fit: BoxFit.cover,
                                            // width: 100,
                                          ),
                                  ],
                                ),
                              )
                            ])
                      ]),
                ],
              ),
            )));
  }
}
