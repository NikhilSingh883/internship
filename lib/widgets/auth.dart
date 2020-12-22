import 'package:flutter/material.dart';
import 'package:internship/size_config.dart';
import 'package:internship/theme.dart';

class AuthModal extends StatefulWidget {
  double _loginYOffset;
  Function changePage;
  AuthModal(this._loginYOffset, this.changePage);

  @override
  _AuthModalState createState() => _AuthModalState();
}

class _AuthModalState extends State<AuthModal> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  Color con = AppTheme.connectButton;
  Color reg = AppTheme.registerButton;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.heightMultiplier * 3,
          vertical: SizeConfig.widthMultiplier * 7),
      height: SizeConfig.heightMultiplier * 66,
      width: double.infinity,
      curve: Curves.linear,
      duration: Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(0, widget._loginYOffset, 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.2 * SizeConfig.widthMultiplier),
            topRight: Radius.circular(5.2 * SizeConfig.widthMultiplier)),
      ),
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
            style: AppTheme.inputStyle,
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
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          TextFormField(
            autocorrect: false,
            style: AppTheme.inputStyle,
            key: ValueKey('password'),
            controller: _pass,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: AppTheme.hintStyle,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 6,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(con)),
              onPressed: () {},
              child: GestureDetector(
                  onTapUp: (_) {
                    setState(() {
                      con = AppTheme.connectButton;
                    });
                  },
                  onTapDown: (_) {
                    setState(() {
                      con = AppTheme.onLongPressColor;
                    });
                  },
                  child: Text(
                    'CONNECT',
                    style: AppTheme.textTheme.headline1,
                  )),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          TextButton(
            child: Text(
              'Forget password',
              // style: AppTheme.subtitle,
            ),
            onPressed: () {
              widget.changePage(2);
            },
          ),
          Spacer(),
          Container(
            child: Text(
              '-OR-',
              style: AppTheme.textTheme.headline4,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(reg),
              ),
              onPressed: () {
                widget.changePage(2);
              },
              child: Text(
                'REGISTER',
                style: AppTheme.textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
