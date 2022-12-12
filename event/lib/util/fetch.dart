import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/event_model.dart';

// class FetchEvent {
//   static List<Event>? listEventMusic;
//   static List<Event>? listEvent;
  Future<List<Event>> fetchEvent() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo

    // List<Event> listEventMusic = [];
    List<Event> listEvent = [];
    for (var d in data) {
      if (d != null) {
        listEvent.add(Event.fromJson(d));
      }

    }

    return listEvent;
  }

Future<List<Event>> fetchEventUser(String username) async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/jsonflutter/$username');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventUser = [];
    for (var d in data) {
      if (d != null) {
        listEventUser.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }

    return listEventUser;
}

Future<List<Event>> fetchMusic() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/music/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventMusic = [];
    for (var d in data) {
      if (d != null) {
        listEventMusic.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventMusic;
}

Future<List<Event>> fetchCulinary() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/culinary/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventCulinary = [];
    for (var d in data) {
      if (d != null) {
        listEventCulinary.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventCulinary;
}

Future<List<Event>> fetchFestival() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/festival/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventFestival = [];
    for (var d in data) {
      if (d != null) {
        listEventFestival.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventFestival;
}

Future<List<Event>> fetchSport() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/sport/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventSport = [];
    for (var d in data) {
      if (d != null) {
        listEventSport.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventSport;
}

Future<List<Event>> fetchCulture() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/culture/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventCulture = [];
    for (var d in data) {
      if (d != null) {
        listEventCulture.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventCulture;
}

Future<List<Event>> fetchOthers() async {
    // static List<Event> listEventMusic;
    var url = Uri.parse('https://trave-lo-gue.up.railway.app/event/others/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> listEventOthers = [];
    for (var d in data) {
      if (d != null) {
        listEventOthers.add(Event.fromJson(d));
      }

      // for (int i = 0; i < listEvent.length; i++) {
      //   print(listEvent[i].toString());
      // }
    }
    return listEventOthers;
}