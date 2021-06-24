import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_app/widgets/inputField.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../provider/great_places_data.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place-screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _textController = TextEditingController();
  File _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void submit() {
    if (_textController.value.text == null || _pickedImage == null) {
      AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.INFO,
        title: 'Alert',
        desc: 'One or More Fields are empty.',
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
      )..show();
      return;
    }
    Provider.of<GreatPlacesData>(context, listen: false)
        .addPlace(_pickedImage, _textController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final greatPlacesData = Provider.of<GreatPlacesData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add place'),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CupertinoTextField(
                        controller: _textController,
                        padding: const EdgeInsets.all(10.0),
                        textCapitalization: TextCapitalization.words,
                        placeholder: 'Enter Title',
                        style: GoogleFonts.quicksand(
                            fontSize: 17, fontWeight: FontWeight.w500),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black.withOpacity(.2),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ImageInput(
                        onSelectImage: selectImage,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              onPressed: submit,
              label: Text('Add Place'),
              elevation: 0.0,
              padding: const EdgeInsets.all(10.0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
