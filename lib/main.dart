import 'package:data_model/model/city.dart';
import 'package:data_model/screen/city-detail.dart';
import 'package:flutter/material.dart';

import 'mock/mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("kurdistan Cities"),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            List<City> _city = cities.map(
              (e) {
                return City.fromMap(e);
              },
            ).toList();

            return newMethod(context, index, _city);
          },
          separatorBuilder: (context, index) => SizedBox(height: 0),
          itemCount: cities.length,
        ),
      ),
    ));
  }

  Padding newMethod(context, int index, city) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(city[index])),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(city[index].image), fit: BoxFit.fill),
                )),
            Positioned(
              top: 185,
              left: 150,
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text(city[index].name)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
