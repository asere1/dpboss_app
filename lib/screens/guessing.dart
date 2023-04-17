import 'package:dpboss/screens/persisten_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class GuesingScreen extends StatelessWidget {
  const GuesingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: const Text(
            'TOP MATKA GESTING',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: const Material(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          child: Center(
            child: Text('coming soon'),
          ),
        ));
  }
}
