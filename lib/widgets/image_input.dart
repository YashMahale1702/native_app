import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart ' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:image_picker/image_picker.dart';
import 'package:scale_button/scale_button.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput({this.onSelectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      preferredCameraDevice: CameraDevice.rear,
      source: ImageSource.camera,
    );

    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final pathName = path.basename(imageFile.path);
    final savedImage = await _storedImage.copy('${appDir.path}/$pathName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * .6,
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
            child: _storedImage == null
                ? Text(
                    'No image chosen...',
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
                      child: Image.file(
                        _storedImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Capture'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            // splashColor: Theme.of(context).accentColor,
          ),
        )
      ],
    );
  }
}
