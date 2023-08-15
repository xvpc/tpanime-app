import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/components/container.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  Map<String, dynamic> data = {};

  Future popular() async {
    var temp = await getPopularAnime();
    setState(() {
      data = temp;
    });
    print('data => $data');
  }

  @override
  void initState() {
    popular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Anime",
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("info");
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
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          // height: double.infinity,
          // width: double.infinity,
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
                  : data["results"] == null || data["results"].isEmpty
                      ? const Center(
                          child: Icon(Icons.filter_list_off_outlined,
                              color: Colors.grey, size: 32))
                      : ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(physics: const ClampingScrollPhysics()),
                          child: GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 260,
                            ),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data["results"].length ?? 0,
                            itemBuilder: (context, index) {
                              return AnimeContainer(
                                  results: data["results"]?[index]);
                            },
                          ),
                        )),
    );
  }
}
