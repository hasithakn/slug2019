import 'package:flutter/material.dart';

class BasicCard extends StatefulWidget {
  BasicCard({this.desc, this.name, this.result, this.time, this.isOver});

  final String name;
  final String desc;
  final String result;
  final String time;
  final bool isOver;

  @override
  _BasicCardState createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
  bool _isOver = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isOver != null) {
      _isOver = widget.isOver;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: _isOver ? Color.fromRGBO(184, 224, 255, 1) : Colors.white,
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.all_inclusive, size: 50),
              ),
              descColumn(),
              time()
            ],
          ),
        ),
      ),
    );
  }

  Widget descColumn() {
    double fs = 25;
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fs),
            ),
            Text(
              widget.desc,
              style: TextStyle(color: Colors.blueGrey, fontSize: 15),
            ),
            Text(
              widget.result,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget time() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            widget.time,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
