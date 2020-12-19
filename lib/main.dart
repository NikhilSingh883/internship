import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship/screens/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:internship/provider/imageProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProvideImage(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              textStyle: TextStyle(
                letterSpacing: 2.5,
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.green,
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.red[300],
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          buttonTheme:
              ButtonTheme.of(context).copyWith(splashColor: Colors.amber),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: AuthScreen(),
          ),
        ),
      ),
    );
  }
}