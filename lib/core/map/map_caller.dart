import 'package:flutter/material.dart';

import '../helper/utils/strings.dart';
import 'place_picker.dart';

class CallMap {
  static void pickLocationFromMap(BuildContext context,
      {required Function(LocationResult? result)? callback,
      LocationResult? result}) async {
    LocationResult? _result =
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlacePicker(
                  AppString.googleMapKey,
                  displayLocation: LatLng(result?.latLng?.latitude ?? .0,
                      result?.latLng?.longitude ?? .0),
                )));
    if (_result != null) {
      callback!(_result);
    }
  }
}
