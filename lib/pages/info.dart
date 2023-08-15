import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';
import 'package:tpanime/data/assetsdata.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/hooks/capitalize.dart';
import 'package:tpanime/hooks/filtertext.dart';

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
    return Scaffold(
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
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ))
          ],
          elevation: 2,
          shadowColor: Colors.white,
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return ScrollConfiguration(
            behavior: const ScrollBehavior()
                .copyWith(physics: const ClampingScrollPhysics()),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    // height: double.infinity,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
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
                                          flex: 2,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  height: 200,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            blurRadius: 1.0,
                                                          )
                                                        ]),
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      placeholder:
                                                          placeholderImage,
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
                                                  top: 40,
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
                                                                  color: Colors
                                                                      .black,
                                                                  blurRadius:
                                                                      10.0,
                                                                  offset:
                                                                      Offset(
                                                                          6, 8))
                                                            ]),
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                          fadeInCurve: Curves
                                                              .fastLinearToSlowEaseIn,
                                                          placeholder:
                                                              placeholderImage,
                                                          image:
                                                              '${data["image"]}',
                                                          fit: BoxFit.cover,
                                                          width: 110,
                                                          height: 150,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 240,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Text(
                                                            maxLines: 3,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium,
                                                            '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Unknown"}'),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        )
                                      : const Placeholder(
                                          color: Colors.red,
                                          fallbackHeight: 200,
                                        ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          data["description"] != null
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border:
                                                              Border.symmetric(
                                                    horizontal: BorderSide(
                                                      color: Color.fromARGB(
                                                          64, 158, 158, 158),
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
                                                              const Color.fromARGB(
                                                                  255, 2, 2, 2),
                                                          barrierColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  160,
                                                                  15,
                                                                  15,
                                                                  15),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          builder: (context) {
                                                            return Container(
                                                              // height: 200,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(15),
                                                              child:
                                                                  ScrollConfiguration(
                                                                behavior: const ScrollBehavior()
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
                                                      textAlign:
                                                          TextAlign.start,
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
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                          Text(
                                                              "${data["status"]}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall)
                                                        ])
                                                      : const SizedBox(
                                                          width: 0),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  (data["studios"] != null ||
                                                          data["studios"]
                                                              .isNotEmpty())
                                                      ? Row(children: [
                                                          Text(
                                                            "Studios: ",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                          Text(
                                                              "${data["studios"]?[0].toUpperCase()}",
                                                              style: Theme.of(
                                                                      context)
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
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium)
                                                        : Text("Unknown",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium)
                                                  ]),
                                                  const SizedBox(
                                                    width: 20,
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
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium)
                                                        : Text(" Unknown ",
                                                            style: Theme.of(
                                                                    context)
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
                                                      width:
                                                          constraints.maxWidth,
                                                      height: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child:
                                                          ScrollConfiguration(
                                                        behavior:
                                                            const ScrollBehavior()
                                                                .copyWith(
                                                                    physics:
                                                                        const BouncingScrollPhysics()),
                                                        child:
                                                            ListView.separated(
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  const SizedBox(
                                                            width: 8,
                                                          ),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              data["genres"]
                                                                  .length,
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ElevatedButton(
                                                              // color: Colors.green,
                                                              style:
                                                                  ButtonStyle(
                                                                shape:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                style: Theme.of(
                                                                        context)
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
                                                    )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  data["characters"] != null
                                      ? Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  isDismissible: true,
                                                  showDragHandle: true,
                                                  enableDrag: true,
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 2, 2, 2),
                                                  barrierColor:
                                                      const Color.fromARGB(
                                                          160, 15, 15, 15),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  builder: (context) {
                                                    return Container(
                                                        // height: 200,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child:
                                                            ListView.separated(
                                                                separatorBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                // scrollDirection:
                                                                //     Axis.horizontal,
                                                                itemCount: data["characters"]
                                                                            .length >
                                                                        0
                                                                    ? data["characters"]
                                                                        .length
                                                                    : 0,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(
                                                                                0.8),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              120,
                                                                          height:
                                                                              120,
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              data["characters"][index]["image"] != null
                                                                                  ? FadeInImage.assetNetwork(
                                                                                      fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                                                                      placeholder: placeholderImage,
                                                                                      image: '${data["characters"][index]["image"]}',
                                                                                      fit: BoxFit.cover,
                                                                                      width: 60,
                                                                                      height: double.maxFinite,
                                                                                    )
                                                                                  : Image.asset(
                                                                                      backupImage,
                                                                                      width: 60,
                                                                                      height: double.maxFinite,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                              (data["characters"][index]["voiceActors"]?.length > 0 && data["characters"][index]["voiceActors"][0]["image"] != null)
                                                                                  ? FadeInImage.assetNetwork(
                                                                                      fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                                                                      placeholder: placeholderImage,
                                                                                      image: '${data["characters"][index]["voiceActors"][0]["image"]}',
                                                                                      fit: BoxFit.cover,
                                                                                      width: 60,
                                                                                      height: double.maxFinite,
                                                                                    )
                                                                                  : Image.asset(
                                                                                      backupImage,
                                                                                      width: 60,
                                                                                      height: double.maxFinite,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            data["characters"][index]["role"] != null
                                                                                ? Text(
                                                                                    "${capitalize(data["characters"][index]["role"])}",
                                                                                    style: const TextStyle(color: Colors.black54),
                                                                                  )
                                                                                : const SizedBox(
                                                                                    width: 0,
                                                                                  ),
                                                                            data["characters"][index]["name"]?["userPreferred"] != null
                                                                                ? Text("${data["characters"][index]["name"]["userPreferred"]}", style: Theme.of(context).textTheme.titleMedium)
                                                                                : data["characters"][index]["name"]?["full"] != null
                                                                                    ? Text("${data["characters"][index]["name"]["full"]}", style: Theme.of(context).textTheme.titleMedium)
                                                                                    : Text("Unknown", style: Theme.of(context).textTheme.titleMedium),
                                                                            data["characters"][index]["voiceActors"]?.length > 0
                                                                                ? data["characters"][index]["voiceActors"][0]["name"]["userPreferred"] != null
                                                                                    ? Text("${data["characters"][index]["voiceActors"][0]["name"]["userPreferred"]}", style: TextStyle(color: Colors.black, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize, fontWeight: FontWeight.bold))
                                                                                    : data["characters"][index]["voiceActors"][0]["name"]["full"] != null
                                                                                        ? Text("${data["characters"][index]["voiceActors"][0]["name"]["full"]}", style: TextStyle(color: Colors.black, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize, fontWeight: FontWeight.bold))
                                                                                        : Text("Unknown", style: TextStyle(color: Colors.black, fontSize: Theme.of(context).textTheme.titleSmall?.fontSize, fontWeight: FontWeight.bold))
                                                                                : const SizedBox(
                                                                                    width: 0,
                                                                                  ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                }));
                                                  });
                                            },
                                            child: Container(
                                              child: Expanded(
                                                child: ListView.separated(
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: data["characters"]
                                                                .length >
                                                            0
                                                        ? data["characters"]
                                                                    .length >
                                                                3
                                                            ? 3
                                                            : data["characters"]
                                                                        .length >
                                                                    2
                                                                ? 2
                                                                : data["characters"]
                                                                            .length >
                                                                        1
                                                                    ? 1
                                                                    : 0
                                                        : 0,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Row(
                                                        children: [
                                                          data["characters"][
                                                                          index]
                                                                      [
                                                                      "image"] !=
                                                                  null
                                                              ? FadeInImage
                                                                  .assetNetwork(
                                                                  fadeInCurve:
                                                                      Curves
                                                                          .fastLinearToSlowEaseIn,
                                                                  placeholder:
                                                                      placeholderImage,
                                                                  image:
                                                                      '${data["characters"][index]["image"]}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 70,
                                                                  height: double
                                                                      .maxFinite,
                                                                )
                                                              : Image.asset(
                                                                  backupImage,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 70,
                                                                  height: double
                                                                      .maxFinite,
                                                                ),
                                                          (data["characters"][index]
                                                                              [
                                                                              "voiceActors"]
                                                                          ?.length >
                                                                      0 &&
                                                                  data["characters"]
                                                                              [
                                                                              index]["voiceActors"][0]
                                                                          [
                                                                          "image"] !=
                                                                      null)
                                                              ? FadeInImage
                                                                  .assetNetwork(
                                                                  fadeInCurve:
                                                                      Curves
                                                                          .fastLinearToSlowEaseIn,
                                                                  placeholder:
                                                                      placeholderImage,
                                                                  image:
                                                                      '${data["characters"][index]["voiceActors"][0]["image"]}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 70,
                                                                  height: double
                                                                      .maxFinite,
                                                                )
                                                              : Image.asset(
                                                                  backupImage,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 70,
                                                                  height: double
                                                                      .maxFinite,
                                                                ),
                                                        ],
                                                      );
                                                    }),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        )
                                ],
                              )),
              ],
            ),
          );
        }));
  }
}
