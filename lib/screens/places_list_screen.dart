import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import './place_detail_screen.dart';
import './add_place_screen.dart';
import '../provider/great_places_data.dart';

class PlacesListScreen extends StatelessWidget {
  static const String routeName = '/places-list-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of All Places'),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlacesData>(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Image.asset(
                    'assets/images/Add notes-pana.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'There Are no places listed yet!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        builder: (ctx, greatPlacesData, child) =>
            greatPlacesData.items.length == 0
                ? child
                : ListView.builder(
                    itemCount: greatPlacesData.items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: const EdgeInsets.all(2.0),
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(.6),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            // radius: 25,
                            backgroundImage: FileImage(
                              greatPlacesData.items[index].image,
                            ),
                          ),
                          title: Text(
                            greatPlacesData.items[index].title.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          trailing: Icon(
                            Icons.location_pin,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(PlaceDetailScreen.routeName);
                          },
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Color(0xffFF725E),
        elevation: 3.0,
        onPressed: () {
          Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
        },
      ),
    );
  }
}
