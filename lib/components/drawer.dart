import 'package:flutter/material.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/hooks/openlink.dart';
import 'package:tpanime/models/collection/colors.dart';
import 'package:tpanime/models/collection/dimensions.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  // home, movie, star, casino_outlined
  List drawerItems = ["Home", "Movies", "Popular", "Random"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.marginVertical),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.screenSize2, vertical: 0),
            child: Column(children: [
              ListTile(
                contentPadding:
                    EdgeInsets.only(left: Dimensions.screenSize5 / 2),
                style: ListTileStyle.drawer,
                titleAlignment: ListTileTitleAlignment.center,
                leading: Text(
                  "Tp Anime",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: Dimensions.screenSize3,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 0.4,
                color: AppColors.overlay,
              )
            ]),
          ),
          Expanded(
            flex: 3,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                physics:
                    const BouncingScrollPhysics(), // Replace with the desired ScrollPhysics
              ),
              child: ListView.separated(
                itemCount: drawerItems.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: Colors.grey,
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  IconData iconName = Icons.error;

                  switch (drawerItems[index]) {
                    case "Home":
                      iconName = Icons.home;
                    case "Movies":
                      iconName = Icons.movie;
                    case "Popular":
                      iconName = Icons.star;
                    case "Random":
                      iconName = Icons.casino;
                  }

                  return Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    // color: Color.fromARGB(144, 140, 202, 219),
                    alignment: Alignment.center,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("${drawerItems[index]}".toLowerCase());
                      },
                      focusColor: const Color.fromARGB(144, 140, 202, 219),
                      iconColor: Colors.grey,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      leading: Icon(iconName, size: Dimensions.screenSize3),
                      title: Text(
                        '${drawerItems[index]}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              openLink(kofiSite);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
                width: 1,
              )),
              child: Image.asset("assets/images/ko-fi.png"),
            ),
          )
        ],
      ),
    );
  }
}
