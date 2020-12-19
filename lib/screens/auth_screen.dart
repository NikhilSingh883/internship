import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:internship/provider/imageProvider.dart';
import 'package:internship/theme.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  int _pageState = 1;

  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  double _loginHeight = 0;
  double _registerHeight = 0;

  double _loginYOffset = 0;
  double _registerYOffset = 0;

  double windowHeight = 0;
  double windowWidth = 0;

  int _pos = 0;
  Timer _timer;

  @override
  void initState() {
    final List<AssetImage> _images =
        Provider.of<ProvideImage>(context, listen: false).getImages;

    const time = const Duration(seconds: 3);
    _timer = Timer.periodic(
        time,
        (Timer timer) => {
              setState(() {
                _pos = (_pos + 1) % _images.length;
              })
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<AssetImage> _images =
        Provider.of<ProvideImage>(context).getImages;

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = 2 * windowHeight / 3;
    _registerHeight = 2 * windowHeight / 3;

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
    }

    return Stack(
      // fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: windowHeight / 2.7,
              child: ImageFade(
                image: _images[_pos],
                fit: BoxFit.cover,
              ),
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
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          height: 2 * windowHeight / 3,
          width: double.infinity,
          curve: Curves.linear,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text(
                  'AUTHENTICATION',
                  style: AppTheme.textTheme.headline5,
                ),
              ),
              TextFormField(
                controller: _email,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                enableSuggestions: false,
                key: ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: AppTheme.hintStyle,
                ),
              ),
              SizedBox(
                height: windowHeight * 0.03,
              ),
              TextFormField(
                autocorrect: false,
                key: ValueKey('password'),
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: AppTheme.hintStyle,
                ),
              ),
              SizedBox(
                height: windowHeight * 0.05,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppTheme.connectButton)),
                  onPressed: () {},
                  child: Text('CONNECT'),
                ),
              ),
              SizedBox(
                height: windowHeight * 0.01,
              ),
              TextButton(
                child: Text('Forget password'),
                onPressed: () {
                  setState(() {
                    _pageState = 2;
                  });
                },
              ),
              Spacer(),
              Container(
                child: Text(
                  '-OR-',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: windowHeight * 0.04,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppTheme.registerButton),
                  ),
                  onPressed: () {
                    _pageState = 2;
                  },
                  child: Text('REGISTER'),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: 2 * windowHeight / 3,
          padding: EdgeInsets.all(32),
          curve: Curves.linear,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Container(
            width: double.infinity,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                _pageState = 1;
              },
              child: Text(
                'BACK',
                style: AppTheme.textTheme.headline1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
