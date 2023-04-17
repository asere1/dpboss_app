import 'package:dpboss/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'persisten_bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String _version = '';

  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _getVersion();
    final dataModel = Provider.of<ScraperProvider>(context, listen: false);

    dataModel.scrapeData();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageTransition(
          // duration: Duration(seconds: 2),
          type: PageTransitionType.fade,
          child: const PersistenBottomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 211, 50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/Dpboss_Net/app_logo.png',
              height: 600,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Version ${_version.substring(0, _version.isEmpty ? 0 : _version.length - 2)}',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
