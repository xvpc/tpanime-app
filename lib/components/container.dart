import 'package:flutter/material.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/pages/info.dart';

class AnimeContainer extends StatelessWidget {
  final results;

  const AnimeContainer({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoPage(
                  infoId: results["id"],
                )));
      },
      child: Card(
        child: Container(
          // height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Positioned(
                        // width: double.infinity,
                        // height: 400,
                        child: FadeInImage.assetNetwork(
                      placeholder: placeholderImage,
                      image: '${results["image"] ?? results["cover"]}',
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            (results["type"] == "MOVIE" &&
                                    results["totalEpisodes"] >= 1)
                                ? 'Full Movie'
                                : '${results["totalEpisodes"]} Ep',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Expanded(
                    flex: 1,
                    child: Tooltip(
                      message:
                          '${results?["title"]["userPreferred"] ?? results?["title"]["english"] ?? results?["title"]["romaji"] ?? results?["title"]["native"] ?? ""}',
                      child: Text(
                          '${results?["title"]["userPreferred"] ?? results?["title"]["english"] ?? results?["title"]["romaji"] ?? results?["title"]["native"] ?? "Unknown"}',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
