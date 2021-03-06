import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  double lattitude;
  double longitude;
  String address;

  PlaceLocation({
    @required this.lattitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.title,
  });
}
