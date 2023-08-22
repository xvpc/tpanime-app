import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';
import 'package:tpanime/components/modals/dialog.dart';
import 'package:tpanime/components/modals/dot.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/data/video.dart';
import 'package:tpanime/hooks/openlink.dart';
import 'package:tpanime/models/collection/colors.dart';
import 'package:tpanime/models/collection/dimensions.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/hooks/capitalize.dart';
import 'package:tpanime/hooks/filtertext.dart';
import 'package:tpanime/models/types.dart';
import 'package:tpanime/pages/characters.dart';

class InfoPage extends StatefulWidget {
  final String infoId;
  const InfoPage({super.key, required this.infoId});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String infoId;

  Map<String, dynamic> data = {};

  Future info() async {
    var temp = await getInfo(infoId);
    setState(() {
      data = temp;
    });
    print('info data => ${data}');
  }

  @override
  void initState() {
    infoId = widget.infoId;
    info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                  '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Anime Info"}'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("popular");
                    },
                    icon: Icon(
                      Icons.search,
                      size: Dimensions.screenSize3,
                      color: Colors.white,
                    ))
              ],
              elevation: 2,
              shadowColor: Colors.white,
              bottom: TabBar(
                isScrollable: true,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                indicator: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 4, color: Colors.white))),
                tabs: [
                  Tab(
                    child: Text("Info",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.fontWeight,
                            overflow: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.overflow)),
                  ),
                  Tab(
                      child: Text("Characters",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontWeight,
                              overflow: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.overflow))),
                  Tab(
                      child: Text("Episodes",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontWeight,
                              overflow: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.overflow))),
                ],
              )),
          drawer: Drawer(
            child: AppDrawer(),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior()
                .copyWith(physics: const ClampingScrollPhysics()),
            child: TabBarView(
              children: [
                InfoWidget(
                  data: data,
                ),
                CharactersWidget(characters: data["characters"]),
                EpisodesWidget(
                  episodes: data["episodes"],
                  mainImage:
                      data["image"] != null ? data["image"] : data["cover"],
                  showTitle: data["title"]?["romaji"] != null
                      ? data["title"]["romaji"]
                      : data["title"]?["english"] != null
                          ? data["title"]["english"]
                          : data["title"]?["native"] != null
                              ? data["title"]["native"]
                              : "Unknown",
                ),
              ],
            ),
          )),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final data;
  const InfoWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior()
          .copyWith(physics: const ClampingScrollPhysics()),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // height: double.infinity,
              // width: Dimensions.screenWidth,
              height: 1000,
              child: data["error"] != null
                  ? ErrorMessage(
                      message: data["error"] ?? "",
                    )
                  : data.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlue,
                          ),
                        )
                      : Column(
                          children: [
                            data["cover"] != null && data["image"] != null
                                ? Expanded(
                                    flex: 3,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            height: Dimensions.bannerHeight,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 1.0,
                                                    )
                                                  ]),
                                              child: FadeInImage.assetNetwork(
                                                placeholder: placeholderImage,
                                                image:
                                                    '${data["cover"] ?? data["image"]}',
                                                fadeInCurve:
                                                    Curves.fastOutSlowIn,
                                                fit: BoxFit.cover,
                                                width: double.maxFinite,
                                                height: double.maxFinite,
                                              ),
                                            )),
                                        Positioned(
                                            top: Dimensions.screenSize4,
                                            left: 10,
                                            // width: 110,
                                            // height: 150,
                                            // width: double.maxFinite,
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black,
                                                            blurRadius: 10.0,
                                                            offset:
                                                                Offset(6, 8))
                                                      ]),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    fadeInCurve: Curves
                                                        .fastLinearToSlowEaseIn,
                                                    placeholder:
                                                        placeholderImage,
                                                    image: '${data["image"]}',
                                                    fit: BoxFit.cover,
                                                    width:
                                                        Dimensions.imageWidth,
                                                    // height: 150,
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      Dimensions.bannerHolder,
                                                  padding: EdgeInsets.all(
                                                      Dimensions.screenSize1),
                                                  child: Text(
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                      '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Unknown"}'),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  )
                                : Placeholder(
                                    color: Colors.red,
                                    fallbackHeight: Dimensions.bannerHeight,
                                  ),
                            Expanded(
                              flex: 12,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    data["description"] != null
                                        ? Container(
                                            padding: EdgeInsets.all(
                                                Dimensions.screenSize2),
                                            decoration: BoxDecoration(
                                                border: Border.symmetric(
                                              horizontal: BorderSide(
                                                color: AppColors.borderColor,
                                                width: 1,
                                              ),
                                            )),
                                            // height: 300,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isDismissible: true,
                                                    showDragHandle: true,
                                                    enableDrag: true,
                                                    backgroundColor:
                                                        AppColors.modalColor,
                                                    barrierColor:
                                                        const Color.fromARGB(
                                                            160, 15, 15, 15),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(Dimensions
                                                                .screenSize1)),
                                                    builder: (context) {
                                                      return Container(
                                                        // height: 200,
                                                        padding: EdgeInsets.all(
                                                            Dimensions
                                                                .screenSize2),
                                                        child:
                                                            ScrollConfiguration(
                                                          behavior:
                                                              const ScrollBehavior()
                                                                  .copyWith(
                                                                      physics:
                                                                          const ClampingScrollPhysics()),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Text(
                                                              '${filterText(data["description"])}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Text(
                                                '${filterText(data["description"])}',
                                                maxLines: 6,
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Unknown"}',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            data["status"] != null
                                                ? Row(children: [
                                                    Text(
                                                      "Status: ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                    ),
                                                    Text("${data["status"]}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall)
                                                  ])
                                                : const SizedBox(width: 0),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            (data["studios"] != null ||
                                                    data["studios"]
                                                        .isNotEmpty())
                                                ? Row(children: [
                                                    Text(
                                                      "Studios: ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall,
                                                    ),
                                                    Text(
                                                        "${data["studios"]?[0].toUpperCase()}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall)
                                                  ])
                                                : const SizedBox(
                                                    width: 0,
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(children: [
                                              Text(
                                                "Start: ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                              data["startDate"] != null ||
                                                      data["startDate"]
                                                          .isNotEmpty()
                                                  ? Text(
                                                      ' ${data["startDate"]?["month"] ?? "??"}/${data["startDate"]?["day"] ?? "??"}/${data["startDate"]?["year"] ?? "??"}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium)
                                                  : Text("Unknown",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium)
                                            ]),
                                            SizedBox(
                                              width: Dimensions.screenSize3,
                                            ),
                                            Row(children: [
                                              Text(
                                                "End: ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                              data["endDate"] != null ||
                                                      data["endDate"]
                                                          .isNotEmpty()
                                                  ? Text(
                                                      ' ${data["endDate"]?["month"] ?? "??"}/${data["endDate"]?["day"] ?? "??"}/${data["endDate"]?["year"] ?? "??"} ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium)
                                                  : Text(" Unknown ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium)
                                            ]),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        (data["genres"].isNotEmpty ||
                                                data["genres"] != null)
                                            ? Container(
                                                width: Dimensions.screenWidth,
                                                height: 30,
                                                alignment: Alignment.center,
                                                child: ScrollConfiguration(
                                                  behavior: const ScrollBehavior()
                                                      .copyWith(
                                                          physics:
                                                              const BouncingScrollPhysics()),
                                                  child: ListView.separated(
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                      width: Dimensions
                                                          .screenSize1,
                                                    ),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        data["genres"].length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ElevatedButton(
                                                        // color: Colors.green,
                                                        style: ButtonStyle(
                                                          shape:
                                                              MaterialStateProperty
                                                                  .all(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3), // Set the border radius as per your requirement
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width:
                                                                      1), // Set the border color and width
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        child: Text(
                                                          '${data["genres"][index]}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 0,
                                              ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        (data["trailer"] != null &&
                                                data["trailer"]["site"] ==
                                                    "youtube" &&
                                                data["trailer"]["id"] != null)
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.screenSize1),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1,
                                                    ),
                                                    color: Colors.grey),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (data["trailer"]["id"]
                                                        is String) {
                                                      openLink(
                                                          "https://www.youtube.com/watch?v=${data["trailer"]["id"]}");
                                                    }
                                                  },
                                                  child: data["trailer"]
                                                              ["thumbnail"] !=
                                                          null
                                                      ? FadeInImage
                                                          .assetNetwork(
                                                          fadeInCurve: Curves
                                                              .fastLinearToSlowEaseIn,
                                                          placeholder:
                                                              placeholderImage,
                                                          image:
                                                              '${data["trailer"]["thumbnail"]}',
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.asset(
                                                          backupImage,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ))
                                            : const SizedBox(
                                                height: 0,
                                              ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const DotWidget()
                          ],
                        )),
        ],
      ),
    );
  }
}

class CharactersWidget extends StatefulWidget {
  final characters;
  const CharactersWidget({super.key, required this.characters});

  @override
  State<CharactersWidget> createState() => _CharactersWidgetState();
}

class _CharactersWidgetState extends State<CharactersWidget> {
  late List? characters;

  @override
  void initState() {
    characters = widget.characters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior()
          .copyWith(physics: const ClampingScrollPhysics()),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // height: double.infinity,
              // width: Dimensions.screenWidth,
              height: Dimensions.screenHeight,
              child: characters == null
                  ? const ErrorMessage(
                      message: "No characters!",
                    )
                  : characters!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlue,
                          ),
                        )
                      : Container(
                          // height: 200,
                          // width: double.infinity,
                          padding: EdgeInsets.all(Dimensions.screenSize1),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: Dimensions.containerWidth,
                                mainAxisExtent: 150,
                              ),
                              // scrollDirection:
                              //     Axis.horizontal,
                              itemCount: characters!.length > 0
                                  ? characters!.length
                                  : 0,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    characterTypes charactersMap =
                                        characterTypes(
                                      id: characters![index]["id"].toString(),
                                      role: characters![index]["role"],
                                      name: characters![index]["name"],
                                      image: characters![index]["image"],
                                      voiceActors: characters![index]
                                          ["voiceActors"],
                                    );

                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return CharacterPage(
                                          character: charactersMap);
                                    }));
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.screenSize1)),
                                      ),
                                      // width: 120,
                                      // height: 120,
                                      child: characters![index]?["image"]
                                              is String
                                          ? Stack(
                                              children: [
                                                Positioned(
                                                    left: 0,
                                                    right: 0,
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      fadeInCurve: Curves
                                                          .fastLinearToSlowEaseIn,
                                                      placeholder:
                                                          placeholderImage,
                                                      image:
                                                          '${characters?[index]["image"]}',
                                                      fit: BoxFit.cover,
                                                      // width: 60,
                                                      // height: double.maxFinite,
                                                    )),
                                                Positioned(
                                                    bottom: 0,
                                                    left: 5,
                                                    width:
                                                        Dimensions.imageWidth,
                                                    child: characters![index]["name"]?[
                                                                "userPreferred"] !=
                                                            null
                                                        ? Text("${characters?[index]["name"]["userPreferred"]}",
                                                            maxLines: 2,
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleMedium)
                                                        : characters![index]["name"]
                                                                    ["full"] !=
                                                                null
                                                            ? Text("${characters?[index]["name"]["full"]}",
                                                                maxLines: 2,
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium)
                                                            : Text("Unknown",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium)),
                                              ],
                                            )
                                          : Stack(
                                              children: [
                                                Positioned(
                                                    left: 0,
                                                    right: 0,
                                                    child: Image.asset(
                                                      backupImage,
                                                      // width: 60,
                                                      // height: double.maxFinite,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Positioned(
                                                    bottom: 0,
                                                    left: 5,
                                                    width:
                                                        Dimensions.imageWidth,
                                                    child: characters![index]["name"]?[
                                                                "userPreferred"] !=
                                                            null
                                                        ? Text("${characters?[index]["name"]["userPreferred"]}",
                                                            maxLines: 2,
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleMedium)
                                                        : characters![index]["name"]
                                                                    ?["full"] !=
                                                                null
                                                            ? Text("${characters?[index]["name"]["full"]}",
                                                                maxLines: 2,
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium)
                                                            : Text("Unknown",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium)),
                                              ],
                                            )),
                                );
                              }))),
        ],
      ),
    );
  }
}

class EpisodesWidget extends StatelessWidget {
  final showTitle;
  final mainImage;
  final episodes;
  const EpisodesWidget(
      {super.key,
      required this.showTitle,
      required this.mainImage,
      required this.episodes});

  @override
  Widget build(BuildContext context) {
    // dialog(context, "hello");
    return ScrollConfiguration(
      behavior: const ScrollBehavior()
          .copyWith(physics: const ClampingScrollPhysics()),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // height: double.infinity,
              // width: Dimensions.screenWidth,
              height: Dimensions.screenHeight,
              child: episodes == null
                  ? const ErrorMessage(
                      message: "No Episodes!",
                    )
                  : episodes.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightBlue,
                          ),
                        )
                      : Container(
                          // height: 200,
                          // width: double.infinity,
                          padding: EdgeInsets.all(Dimensions.screenSize1),
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              // scrollDirection:
                              //     Axis.horizontal,
                              itemCount:
                                  episodes.length > 0 ? episodes.length : 0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    Map<String, dynamic> data =
                                        await getEpisode(
                                            episodes[index]["id"].toString());
                                    if (data["error"] != null) {
                                      dialog(context, data["error"].toString());
                                    } else {
                                      print("data => ${data}");

                                      showModalBottomSheet(
                                          context: context,
                                          isDismissible: true,
                                          showDragHandle: true,
                                          enableDrag: true,
                                          backgroundColor: AppColors.modalColor,
                                          barrierColor: const Color.fromARGB(
                                              160, 15, 15, 15),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.screenSize1)),
                                          builder: (context) {
                                            return Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding: EdgeInsets.all(
                                                    Dimensions.screenSize1),
                                                child: ScrollConfiguration(
                                                    behavior: const ScrollBehavior()
                                                        .copyWith(
                                                            physics:
                                                                const ClampingScrollPhysics()),
                                                    child: (data["sources"] !=
                                                                null ||
                                                            data["sources"]
                                                                .isNotEmpty)
                                                        ? Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                                Text(
                                                                    "Episode ${index + 1}",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleLarge
                                                                          ?.fontSize,
                                                                      overflow: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleLarge
                                                                          ?.overflow,
                                                                      fontWeight: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleLarge
                                                                          ?.fontWeight,
                                                                    )),
                                                                Expanded(
                                                                  child: ListView
                                                                      .builder(
                                                                    itemCount:
                                                                        data["sources"].length ??
                                                                            0,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return InkWell(
                                                                        onTap:
                                                                            () {
                                                                          if (data["sources"][index]["url"] !=
                                                                              null) {
                                                                            runPlayer(data["sources"][index]["url"],
                                                                                context);
                                                                          }
                                                                        },
                                                                        child:
                                                                            ListTile(
                                                                          leading:
                                                                              Text(
                                                                            "${capitalize(data["sources"][index]["quality"] ?? "")}",
                                                                            style:
                                                                                Theme.of(context).textTheme.titleMedium,
                                                                          ),
                                                                          trailing: Icon(
                                                                              Icons.play_circle_outline,
                                                                              color: data["sources"][index]["url"] != null ? Colors.green : Colors.red,
                                                                              size: Dimensions.screenSize3),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                )
                                                              ])
                                                        : Text(
                                                            "No Sources Available!",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleLarge
                                                                    ?.fontSize,
                                                                fontWeight: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleLarge
                                                                    ?.fontWeight,
                                                                overflow: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleLarge
                                                                    ?.overflow,
                                                                color: Colors
                                                                    .grey),
                                                          )));
                                          });
                                    }
                                  },
                                  child: Container(
                                      height: Dimensions.bannerHeight,
                                      width: double.maxFinite,
                                      padding: EdgeInsets.all(
                                          Dimensions.screenSize1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                left: 0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: episodes[index]
                                                            ["image"] !=
                                                        null
                                                    ? FadeInImage.assetNetwork(
                                                        fadeInCurve: Curves
                                                            .fastLinearToSlowEaseIn,
                                                        placeholder:
                                                            placeholderImage,
                                                        image:
                                                            '${episodes[index]["image"]}',
                                                        fit: BoxFit.cover,
                                                        // height: double.maxFinite,
                                                      )
                                                    : mainImage != null
                                                        ? FadeInImage
                                                            .assetNetwork(
                                                            fadeInCurve: Curves
                                                                .fastLinearToSlowEaseIn,
                                                            placeholder:
                                                                placeholderImage,
                                                            image:
                                                                '${mainImage}',
                                                            fit: BoxFit.cover,
                                                            // height: double.maxFinite,
                                                          )
                                                        : Image.asset(
                                                            backupImage,
                                                            // height: double.maxFinite,
                                                            fit: BoxFit.cover,
                                                          )),
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                height: 35,
                                                width: 35,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black26),
                                                    child: (episodes[index][
                                                                    "number"] !=
                                                                null ||
                                                            episodes[index]
                                                                    ["number"] >
                                                                0)
                                                        ? Text(
                                                            "${episodes[index]["number"]}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge,
                                                          )
                                                        : Text(
                                                            "${index + 1}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge,
                                                          ))),
                                            Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                height: 40,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.black26),
                                                    child: episodes[index]
                                                                ["title"] !=
                                                            null
                                                        ? Text(
                                                            "${episodes[index]["title"]}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium,
                                                          )
                                                        : showTitle != null
                                                            ? Text(
                                                                "${showTitle}",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              )
                                                            : Text(
                                                                "Episode ${index + 1}",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              )))
                                          ],
                                        ),
                                      )),
                                );
                              }))),
        ],
      ),
    );
  }
}
