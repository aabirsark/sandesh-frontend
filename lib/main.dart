import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/configs/db.config.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/meta/views/home/home_page.dart';
import 'package:sandesh/meta/views/onboardings/onboarding.dart';
import 'package:provider/provider.dart';

import 'package:sandesh/model/core/home%20provider/home.provider.dart';
import 'package:sandesh/model/core/util%20provider/load_up.provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await dbConfig();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoadUpProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeStateProvider(),
      ),
    ],
    child: const SandeshApp(),
  ));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black));
}

class SandeshApp extends StatefulWidget {
  const SandeshApp({Key? key}) : super(key: key);

  @override
  State<SandeshApp> createState() => _SandeshAppState();
}

class _SandeshAppState extends State<SandeshApp> {
  bool firstTime = UserDataDB.uid == null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
              elevation: .0,
              color: Colors.black,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 18),
              iconTheme: const IconThemeData(color: Colors.white)),
          scaffoldBackgroundColor: Colors.black,
          primaryColor: primaryColor),
      home: UserDataDB.username == null ? const OnBoarding() : const HomePage(),
    );
  }
}
