import 'package:flutter/material.dart';
import 'cards/sport_card.dart';
import 'package:intl/intl.dart';
import 'functions/request.dart';
import 'entity/sport_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static DateTime date;

  List<SportDetails> details;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = DateTime.now();
    Func().getDetails(DateFormat("dd-MM-yyyy").format(date)).then((a) {
      details = a;
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => pickdate(),
        icon: Icon(Icons.date_range),
        label: Text("Change Date"),
      ),
      appBar: AppBar(
        title: Text("SLUG 2019"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                relode();
              },
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Date : " + DateFormat("dd-MM-yyyy").format(date),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Container(
//              height: 5555,
                child: Center(
                    child: loading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: details.length,
                            itemBuilder: (context, i) {
                              return BasicCard(
                                sport: details[i].sport,
                                winUni: details[i].winUni,
                                comment: details[i].comment,
                                picUrl: details[i].picUrl,
                                uni1: details[i].uni1,
                                uni2: details[i].uni2,
                                venue: details[i].venue,
                              );
                            },
                          ))),
          ),
        ],
      ),
    );
  }

  void relode() {
    loading = true;
    setState(() {});
    Func().getDetails(DateFormat("dd-MM-yyyy").format(date)).then((a) {
      details = a;
      loading = false;
      setState(() {});
    });
  }

  pickdate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2019, 4),
        lastDate: DateTime(2019, 10));
    if (picked != null && picked != date) {
      print(picked);
      date = picked;
      relode();
    }
  }
}

//ListView(
//children: <Widget>[
//BasicCard(
//desc: "University of Ruhuna vs University of Moratuwa",
//name: "Cricket",
//result: "University of Ruhuna won",
//time: "8.30PM",
//),
//],
//),
