import 'package:flutter/material.dart';

import '../../data/const.dart';
import '../../data/image/image.dart';

class CollectionController extends ChangeNotifier {
  final List<MyImage> _images = kImageList;
  final List<MyImage> _collection = [];
  final List<MyImage> _likes = [];

  List<MyImage> get myCollection => _collection;
  List<MyImage> get myImages => _images;
  List<MyImage> get myLikes => _likes;

  //Likes
  void like(MyImage likes) {
    _likes.add(likes);
    notifyListeners();
  }

  void unlike(MyImage likes) {
    _likes.remove(likes);
    notifyListeners();
  }

  bool markedLikes(MyImage likes) {
    return _likes.contains(likes);
  }

  // Collection
  void mark(MyImage image) {
    _collection.add(image);
    notifyListeners();
  }

  void unmark(MyImage image) {
    _collection.remove(image);
    notifyListeners();
  }

  bool isMarked(MyImage image) {
    return _collection.contains(image);
  }

  void removeAll() {
    _collection.clear();
    notifyListeners();
  }
}
