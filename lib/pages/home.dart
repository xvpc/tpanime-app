import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/components/container.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:tpanime/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> data = {};

  Future trending() async {
    var temp = await getTrending();
    setState(() {
      data = temp;
    });
    print('data => $data');
  }

  @override
  void initState() {
    trending();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Trending Now", style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed("info");
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(
                Icons.search,
                size: Dimensions.screenSize3,
                color: Colors.white,
              ))
        ],
        elevation: 0.2,
        shadowColor: Colors.white,
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenSize1, vertical: 10),
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
                      ? Center(
                          child: Icon(Icons.filter_list_off_outlined,
                              color: Colors.grey, size: Dimensions.screenSize4))
                      : ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(physics: const ClampingScrollPhysics()),
                          child: GridView.builder(
                            // padding: EdgeInsets.all(Dimensions.screenSize1),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 280,
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
