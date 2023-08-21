import 'package:flutter/material.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  // home, movie, star, casino_outlined
  List drawerItems = ["Home", "Movies", "Popular", "Random"];

  final Uri donateUrl = Uri.parse('https://ko-fi.com/tpanime');
  Future<void> _launchUrl() async {
    if (await launchUrl(donateUrl)) {
      await launchUrl(mode: LaunchMode.externalApplication, donateUrl);
    } else {
      throw Exception('Could not launch $donateUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.marginVertical),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
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
                      leading: Icon(iconName, size: Dimensions.screenSize2),
                      title: Text(
                        '${drawerItems[index]}',
                        style: TextStyle(
                            fontSize: Dimensions.screenSize2,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: _launchUrl,
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
