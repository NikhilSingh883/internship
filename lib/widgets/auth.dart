import 'package:flutter/material.dart';
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
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
          horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      height: 2 * windowHeight / 3,
      width: double.infinity,
      curve: Curves.linear,
      duration: Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(0, widget._loginYOffset, 1),
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
              style: TextStyle(
                  fontSize: windowHeight * 0.035,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600),
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
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
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
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: windowHeight * 0.05,
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
                    style: TextStyle(fontSize: windowHeight * 0.025),
                  )),
            ),
          ),
          SizedBox(
            height: windowHeight * 0.01,
          ),
          TextButton(
            child: Text(
              'Forget password',
              style: TextStyle(fontSize: windowHeight * 0.02),
            ),
            onPressed: () {
              widget.changePage(2);
            },
          ),
          Spacer(),
          Container(
            child: Text(
              '-OR-',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: windowHeight * 0.03),
            ),
          ),
          SizedBox(
            height: windowHeight * 0.04,
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
                style: TextStyle(fontSize: windowHeight * 0.025),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
