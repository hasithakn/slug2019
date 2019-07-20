import 'package:flutter/material.dart';
import 'cards/sport_card.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.date_range),
        label: Text("Change Date"),
      ),
      appBar: AppBar(
        title: Text("SLUG 2019"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Date : " + DateFormat("dd-MM-yyyy").format(now),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Container(
//              height: 5555,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                        isOver: true,
                      ),
                      BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),
                      BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                        isOver: true,
                      ),BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),
                      BasicCard(
                        desc: "University of Ruhuna vs University of Moratuwa",
                        name: "Cricket",
                        result: "University of Ruhuna won",
                        time: "8.30PM",
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
