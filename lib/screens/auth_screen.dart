import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:internship/provider/imageProvider.dart';
import 'package:internship/theme.dart';
import 'package:internship/widgets/auth.dart';
import 'package:internship/widgets/register.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  int _pageState = 0;

  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  double _loginHeight = 0;
  double _registerHeight = 0;
  double _loginYOffset = 0;
  double _registerYOffset = 0;
  double windowHeight = 0;
  double windowWidth = 0;

  int _pos = 0;

  Color con = AppTheme.connectButton;
  Color reg = AppTheme.registerButton;

  void changePage(int page) {
    setState(() {
      _pageState = page;
    });
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        _pageState = 1;
      });
    });

    Timer.periodic(Duration(seconds: 5), (timer) {
      Provider.of<ProvideImage>(context, listen: false).changePhoto();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 1:
        _loginYOffset = windowHeight / 3;
        _loginHeight = 2 * windowHeight / 3;
        _registerYOffset = windowHeight;
        _registerHeight = 0;
        break;
      case 2:
        _registerHeight = 2 * windowHeight / 3;
        _loginYOffset = windowHeight;
        _loginHeight = 0;
        _registerYOffset = windowHeight / 3;
        _registerHeight = 2 * windowHeight / 3;
        break;
      default:
        _loginYOffset = windowHeight;
        _loginHeight = 0;
        _registerYOffset = windowHeight;
        _registerHeight = 0;
    }

    return Stack(
      // fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<ProvideImage>(
              builder: (context, photos, child) {
                return Container(
                  width: double.infinity,
                  height: windowHeight / 2.7,
                  child: ImageFade(
                    fadeDuration: Duration(seconds: 1),
                    image: photos.getPhoto,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
        Positioned(
          top: windowHeight / 3.3,
          left: windowWidth / 20,
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Text(
              _pageState == 1 ? 'Connection' : 'Connect',
              style: AppTheme.textTheme.caption,
            ),
          ),
        ),
        AuthModal(_pageState, _loginYOffset, changePage),
        RegisterModal(_pageState, _registerYOffset, changePage),
      ],
    );
  }
}
