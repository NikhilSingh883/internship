import 'package:flutter/material.dart';

class ProvideImage with ChangeNotifier {
  List<AssetImage> _bg = [
    AssetImage('assets/image0.jpg'),
    AssetImage('assets/image1.jpg'),
    AssetImage('assets/image2.jpg'),
    AssetImage('assets/mainScreen4.jpg'),
    AssetImage('assets/mainScreen5.jpg'),
  ];

  List<AssetImage> get getImages {
    return [..._bg];
  }
}
