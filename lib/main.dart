import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:internship/redux/reducers.dart';
import 'package:internship/screens/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:internship/provider/imageProvider.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

@immutable
class AppState {
  final pos;
  AppState(this.pos);
}

class MyApp extends StatelessWidget {
  final store = new Store(reducer, initialState: new AppState(0));

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
          fontFamily: 'Montserrat',
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
              elevation: 0,
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
        home: StoreProvider(
            store: store,
            child:
                Scaffold(resizeToAvoidBottomInset: false, body: AuthScreen())),
      ),
    );
  }
}
