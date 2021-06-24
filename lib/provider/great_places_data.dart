import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:native_app/models/place.dart';

import '../helpers/db_helper.dart';

class GreatPlacesData with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(File pickedImage, String pickedTitle) {
    final newID = DateTime.now().toString();
    final newPlace = Place(
      id: newID,
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);

    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
