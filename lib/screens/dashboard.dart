import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/model.dart';
import '../services/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scraperProvider = Provider.of<ScraperProvider>(context, listen: true);

    return Scaffold(
      onDrawerChanged: ((bool isOpened) {
        scraperProvider.onDrawerStateChanged(isOpened);
      }),
      backgroundColor: const Color.fromARGB(255, 255, 211, 50),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 80,
        leading: Builder(builder: (ctx) {
          return TextButton(
            child: Image.asset(
              'assets/Dpboss_Net/ICON/menu.png',
              height: 55,
            ),
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
          );
        }),
        backgroundColor: const Color.fromARGB(255, 255, 211, 50),
        title: Image.asset(
          'assets/Dpboss_Net/app_logo.png',
          height: 200,
          // width: 400,
        ),
        actions: [
          TextButton(
            child: Image.asset(
              'assets/Dpboss_Net/ICON/newspaper-folded.png',
              height: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: .6,
                    ),
                  ),
                  color: Colors.amber[400]!.withOpacity(.85),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/Dpboss_Net/app_logo.png',
                    fit: BoxFit.cover,
                    // height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height * .01),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.gaugeHigh,
                      size: 33,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(
                      Icons.bar_chart_rounded,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Charts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const ImageIcon(
                      AssetImage('assets/Dpboss_Net/ICON/guesing-icon.png'),
                      size: 40,
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Free Guesing',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(
                      Icons.question_mark_rounded,
                      size: 40,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Loknama Paper',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Icon(
                      Icons.telegram,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 21,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Join Telegram',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.question_answer_rounded,
                      size: 35,
                      color: Colors.amber[400],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 28,
                    ),
                    ImageIcon(
                      const AssetImage('assets/Dpboss_Net/ICON/share-icon.png'),
                      size: 30,
                      color: Colors.blue[800],
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Share App',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
                        width: MediaQuery.of(context).size.width * (.09),
                      ),
                      const Text(
                        'LIVE   RESULT',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: .8,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    child: scraperProvider.cardItems.isEmpty
                        ? const Center(
                            child: Text(
                            'No Live Result',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                        : ListView.builder(
                            itemCount: scraperProvider.cardItems.length,
                            itemBuilder: (context, index) {
                              List<CardItemModel> cardItems =
                                  scraperProvider.cardItems;
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    cardItems[index].gn,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    cardItems[index].gr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        Colors.blue[900],
                                      ),
                                    ),
                                    onPressed: () {
                                      scraperProvider.fetchCardItems();
                                    },
                                    child: const Text(
                                      "REFRESH",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (.03),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (.09),
                      ),
                      const Text(
                        'ALL   MARKETS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .070),
                    child: scraperProvider.markets.isEmpty
                        ? SizedBox(
                            height: (MediaQuery.of(context).size.height -
                                    AppBar().preferredSize.height -
                                    MediaQuery.of(context).padding.top -
                                    MediaQuery.of(context).padding.bottom) *
                                1 /
                                3,
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
                              List<MarketModel> markets =
                                  scraperProvider.markets;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        markets[index].title,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '( ${markets[index].time} )',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    markets[index].scorr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 25,
                                child: Divider(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
