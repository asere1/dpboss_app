import 'package:dpboss/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'services/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Set the app to portrait mode only
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    await FirebaseMessaging.instance.getInitialMessage();
    await FirebaseAuth.instance.signInAnonymously();
  } catch (e) {
    print(e.toString());
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ScraperProvider>(
            create: (_) => ScraperProvider()),
        ChangeNotifierProvider<FirebaseProvider>(
            create: (_) => FirebaseProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.arimoTextTheme()),
      home: const SplashScreen(),
    );
  }
}
