import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/components/container.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:tpanime/pages/search.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Map<String, dynamic> data = {};

  Future movies() async {
    var temp = await getMovies();
    setState(() {
      data = temp;
    });
    print('data => $data');
  }

  @override
  void initState() {
    movies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies", style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed("movies");
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                            padding: EdgeInsets.all(Dimensions.screenSize1),
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
