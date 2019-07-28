import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BasicCard extends StatefulWidget {
  BasicCard(
      {this.sport,
      this.venue,
      this.uni1,
      this.uni2,
      this.winUni,
      this.comment,
      this.picUrl});

  final String sport;
  final String venue;
  final String uni1;
  final String uni2;
  final String winUni;
  final String comment;
  final String picUrl;

  @override
  _BasicCardState createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _showDialog();
      },
      title: SafeArea(
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.picUrl,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              descColumn(),
//              time()
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: new Text("Details",style: TextStyle(fontSize: 25),),
          content: Container(
            height: MediaQuery.of(context).size.height/2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.picUrl,
                    ),
                  ),
                ),
                descColumn(),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget descColumn() {
    double fs = 20;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: widget.sport,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: fs),
                  ),
                  new TextSpan(
                    text: "  | " + widget.venue,
                    style: TextStyle(color: Colors.blueGrey[800], fontSize: 10),
                  ),
                ],
              ),
            ),
            Text(
              widget.uni1 + " Vs " + widget.uni2,
              style: TextStyle(color: Colors.blueGrey, fontSize: 15),
            ),
            Text(
              "Won by : " + widget.winUni,
              style: TextStyle(
//                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.comment,
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
}
