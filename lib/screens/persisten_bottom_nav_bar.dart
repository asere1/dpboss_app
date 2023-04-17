import 'package:dpboss/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'chart.dart';
import 'chat.dart';
import 'dashboard.dart';
import 'guessing.dart';
class PersistenBottomNavBar extends StatefulWidget {
  const PersistenBottomNavBar({super.key});

  @override
  State<PersistenBottomNavBar> createState() => PersistenBottomNavBarState();
}

class PersistenBottomNavBarState extends State<PersistenBottomNavBar>
    with SingleTickerProviderStateMixin {
  final PersistentTabController _controller = PersistentTabController();

  bool loading = false;

  List<Widget> _buildScreens() {
    return [
      const DashboardScreen(),
      const ChartScreen(),
      Container(),
      const GuesingScreen(),
      const ChatScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(
          FontAwesomeIcons.gaugeHigh,
          size: 24,
        ),
        title: 'Dashboard',
        textStyle: const TextStyle(color: Colors.black),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black.withOpacity(.6),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bar_chart),
        title: 'Chart',
        textStyle: const TextStyle(
          color: Colors.black,
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black.withOpacity(.6),
      ),
      PersistentBottomNavBarItem(
        onPressed: (p0) {
          Provider.of<ScraperProvider>(context, listen: false).scrapeData();
        },
        icon: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 3.0,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.amber[400],
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/Dpboss_Net/ICON/reload.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: 'REFRESH',
        textStyle: const TextStyle(color: Colors.black),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: Colors.black.withOpacity(.6),
        inactiveColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.lightbulb),
        title: 'Guesing',
        textStyle: const TextStyle(color: Colors.black),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black.withOpacity(.6),
      ),
      PersistentBottomNavBarItem(
        onPressed: (p0) {
          // Provider.of<ScraperProvider>(context).onDrawerStateChanged(true);
          final firebaseProvider =
              Provider.of<FirebaseProvider>(context, listen: false);
          firebaseProvider.generateToken();
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const ChatScreen(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        icon: const Icon(
          Icons.question_answer_rounded,
        ),
        title: 'chat',
        textStyle: const TextStyle(color: Colors.black),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black.withOpacity(.6),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScraperProvider>(context);
    return PersistentTabView(
      context,
      controller: _controller,
      hideNavigationBar: provider.onDrawerChanged,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 65,

      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 20,
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
