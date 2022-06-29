import 'package:flutter/material.dart';

import '../model/city.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this._city, {Key? key}) : super(key: key);

  final City _city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: Image.network(
              _city.image,
              fit: BoxFit.fill,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              _city.name,
              style: TextStyle(fontSize: 25),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  _city.detail,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.black,
              )),
        ),
      ]),
    );
  }
}
