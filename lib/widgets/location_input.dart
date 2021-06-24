import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewimageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Center(
            child: _previewimageUrl == null
                ? Text(
                    'Location not selected...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        _previewimageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ignore: deprecated_member_use
            RaisedButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              // splashColor: Theme.of(context).accentColor,
            ),
            SizedBox(
              width: 20,
            ),
            // ignore: deprecated_member_use
            RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Select on map'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              // splashColor: Theme.of(context).accentColor,
            )
          ],
        )
      ],
    );
  }
}
