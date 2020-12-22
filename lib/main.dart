import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:internship/redux/reducers.dart';
import 'package:internship/screens/auth_screen.dart';
import 'package:internship/size_config.dart';
import 'package:provider/provider.dart';
import 'package:internship/provider/imageProvider.dart';
import 'package:redux/redux.dart';

void main() {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
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
                      fontSize: 2.3 * SizeConfig.heightMultiplier,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: SizeConfig.widthMultiplier / 2,
                    ),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: TextButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.widthMultiplier * 10)),
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 2 * SizeConfig.heightMultiplier,
                      ),
                      textStyle: TextStyle(
                        letterSpacing: SizeConfig.widthMultiplier / 2,
                        fontWeight: FontWeight.w300,
                        fontSize: SizeConfig.heightMultiplier * 2.3,
                      ),
                    ),
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 1.9 * SizeConfig.heightMultiplier,
                        color: Colors.red[300],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  buttonTheme: ButtonTheme.of(context)
                      .copyWith(splashColor: Colors.amber),
                ),
                debugShowCheckedModeBanner: false,
                home: StoreProvider(
                    store: store,
                    child: Scaffold(
                        resizeToAvoidBottomInset: false, body: AuthScreen())),
              ),
            );
          },
        );
      },
    );
  }
}
