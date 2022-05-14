import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  //使用者剛打開時沒有Track
  Song? selected;

  //方法監聽
  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
