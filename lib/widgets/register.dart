import 'package:flutter/material.dart';

class RegisterModal extends StatefulWidget {
  int _pageState;
  double _registerYOffset;
  Function changePage;
  RegisterModal(this._pageState, this._registerYOffset, this.changePage);
  @override
  _RegisterModalState createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: 2 * windowHeight / 3,
      padding: EdgeInsets.all(32),
      curve: Curves.linear,
      duration: Duration(milliseconds: 1000),
      transform: Matrix4.translationValues(0, widget._registerYOffset, 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Container(
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
            onPressed: () {
              widget.changePage(1);
            },
            child: Text('BACK')),
      ),
    );
  }
}
