import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/meta/views/home/home_page.dart';
import 'package:sandesh/meta/views/onboardings/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:sandesh/model/core/auth%20provider/sign_up.provider.dart';
import 'package:sandesh/model/core/home%20provider/home.provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await UserDataDB.config();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
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
      home: const HomePage(),
    );
  }
}
