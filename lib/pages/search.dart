import 'package:flutter/material.dart';
import 'package:tpanime/components/container.dart';
import 'package:tpanime/components/errorMessage.dart';
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/models/collection/dimensions.dart';

class DataSearch extends SearchDelegate {
  Map<String, dynamic> data = {};

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
          color: Colors.white70,
          size: Dimensions.screenSize3,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.grey,
        size: Dimensions.screenSize3,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("hello world!");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        Future popular() async {
          data = await getSearch(query: query, page: 1);
          // print('data => $data');
          // print('query from searchDelegante => $query');
        }

        if (query.isNotEmpty) {
          popular();
          // print('data from condition => $data');
        } else {
          data = {};
        }
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            // height: double.infinity,
            // width: double.infinity,
            child: query.isEmpty || query.length <= 1
                ? Center(
                    child: Icon(Icons.manage_search,
                        color: Colors.grey, size: Dimensions.screenSize4))
                : data["error"] != null
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
                                child: Icon(Icons.search_off_outlined,
                                    color: Colors.grey,
                                    size: Dimensions.screenSize4))
                            : ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(
                                    physics: const ClampingScrollPhysics()),
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
                              ));
      },
    );
  }
}
