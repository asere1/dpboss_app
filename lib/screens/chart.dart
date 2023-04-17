import 'package:dpboss/screens/persisten_bottom_nav_bar.dart';
import 'package:dpboss/screens/web_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:dpboss/models/model.dart';
import 'package:provider/provider.dart';
import '../services/provider.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scraperProvider = Provider.of<ScraperProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 211, 50),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .09,
          leading: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const PersistenBottomNavBar(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: const ImageIcon(
                  AssetImage('assets/Dpboss_Net/ICON/arrow.png'),
                  size: 27,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          elevation: 0,
          leadingWidth: 45,
          backgroundColor: const Color.fromARGB(255, 255, 211, 50),
          title: const Text('CHARTS',
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        body: Material(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (.03),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (.07),
                      ),
                      const Text(
                        'All    Market   Charts',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.3),
                  ),
                  scraperProvider.markets.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .7,
                          child: const Center(
                              child: Text(
                            'No Markets Available ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )))
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: scraperProvider.markets.length,
                          itemBuilder: (context, index) {
                            List<MarketModel> markets = scraperProvider.markets;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * (.06),
                                ),
                                Text(
                                  markets[index].title,
                                  style: TextStyle(
                                      fontSize:
                                          (markets[index].title.length > 13)
                                              ? 15
                                              : 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                if (markets[index].title.length > 13)
                                  const SizedBox.shrink(),
                                const Spacer(
                                  flex: 2,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          (.1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.amber[300],
                                          ),
                                        ),
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: WebViewScreen(
                                              url: markets[index].jodiLink,
                                            ),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: const Text(
                                          "JODI",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 10),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          iconSize:
                                              const MaterialStatePropertyAll(2),
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.amber[300],
                                          ),
                                        ),
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: WebViewScreen(
                                                url: markets[index].panelLink),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: const Text(
                                          "PANEL",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.1),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
