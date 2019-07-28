import 'package:flutter/material.dart';


class SportDetails{
    String _sport;
    String _venue;
    String _uni1;
    String _uni2;
    String _winUni;
    String _comment;
    String _picUrl;

    String get uni2 => _uni2;

    set uni2(String value) {
      _uni2 = value;
    }

    String get picUrl => _picUrl;

    set picUrl(String value) {
      _picUrl = value;
    }

    String get uni1 => _uni1;

    set uni1(String value) {
      _uni1 = value;
    }

    String get comment => _comment;

    set comment(String value) {
      _comment = value;
    }

    String get sport => _sport;

    set sport(String value) {
      _sport = value;
    }

    String get winUni => _winUni;

    set winUni(String value) {
      _winUni = value;
    }

    String get venue => _venue;

    set venue(String value) {
      _venue = value;
    }


}