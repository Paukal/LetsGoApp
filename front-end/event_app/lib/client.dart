import 'package:http/http.dart' as http;
import 'dart:io';
import 'eventsParse.dart';
import 'placesParse.dart';
import 'dart:convert';

Future<List<Event>> fetchEventList(
    bool filterDateToday,
    bool filterDateTomorrow,
    bool filterDateThisWeek,
    bool filterDateYesterday,
    bool filterDateLastWeek) async {
  List<Event> list = await fetchEventData();
  List<Event> filteredList = new List.empty(growable: true);
  final DateTime now = DateTime.now();

  if (filterDateLastWeek) {
    Iterator<Event> it = list.iterator;
    while (it.moveNext()) {
      final date = DateTime.parse(it.current.startDate);
      if (date.difference(now).inDays < -1 && date.difference(now).inDays > -8 &&
          DateTime.parse(it.current.startDate).isBefore(now)) {
        filteredList.add(it.current);
      }
    }
  }
  if (filterDateYesterday) {
    Iterator<Event> it = list.iterator;
    while (it.moveNext()) {
      final date = DateTime.parse(it.current.startDate);
      if ((date.day - now.day == -1 || date.day - now.day > 26) &&
      date.difference(now).inDays == -1 &&
          DateTime.parse(it.current.startDate).isBefore(now)) {
        filteredList.add(it.current);
      }
    }
  }
  if (filterDateThisWeek) {
    Iterator<Event> it = list.iterator;
    while (it.moveNext()) {
      final date = DateTime.parse(it.current.startDate);
      if (date.difference(now).inDays > 1 && date.difference(now).inDays < 8 &&
          DateTime.parse(it.current.startDate).isAfter(now)) {
        filteredList.add(it.current);
      }
    }
  }
  if (filterDateTomorrow) {
    Iterator<Event> it = list.iterator;
    while (it.moveNext()) {
      final date = DateTime.parse(it.current.startDate);
      if ((date.day - now.day == 1 || date.day - now.day < 0) &&
          (date.difference(now).inDays == 1) &&
          DateTime.parse(it.current.startDate).isAfter(now)) {
        filteredList.add(it.current);
      }
    }
  }
  if (filterDateToday) {
    Iterator<Event> it = list.iterator;
    while (it.moveNext()) {
      final date = DateTime.parse(it.current.startDate);
      if (date.difference(now).inDays == 0 &&
          date.day == now.day &&
          DateTime.parse(it.current.startDate).isAfter(now)) {
        filteredList.add(it.current);
      }
    }
  }
  return filteredList;
}

Future<List<Event>> fetchEventData() async {
  var url = Uri.parse('http://10.0.2.2:8081/events'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  EventCollection collection = EventCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list;
}

Future<List<Place>> fetchPlaceList(
    bool restPlaces,
    bool sceneryPlaces,
    bool hikingTrails,
    bool forts,
    bool bikeTrails,
    bool streetArt,
    bool museums,
    bool architecture,
    bool nature,
    bool history,
    bool trails,
    bool expositions,
    bool parks,
    bool sculptures,
    bool churches,
    bool mounds) async {
  List<Place> list = await fetchPlaceData();
  List<Place> filteredList = new List.empty(growable: true);

  if (restPlaces) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "restPlaces") {
        filteredList.add(it.current);
      }
    }
  }

  if (sceneryPlaces) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "sceneryPlaces") {
        filteredList.add(it.current);
      }
    }
  }
  if (hikingTrails) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "hikingTrails") {
        filteredList.add(it.current);
      }
    }
  }
  if (forts) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "forts") {
        filteredList.add(it.current);
      }
    }
  }
  if (bikeTrails) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "bikeTrails") {
        filteredList.add(it.current);
      }
    }
  }
  if (streetArt) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "streetArt") {
        filteredList.add(it.current);
      }
    }
  }
  if (museums) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "museums") {
        filteredList.add(it.current);
      }
    }
  }
  if (architecture) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "architecture") {
        filteredList.add(it.current);
      }
    }
  }
  if (nature) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "nature") {
        filteredList.add(it.current);
      }
    }
  }
  if (history) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "history") {
        filteredList.add(it.current);
      }
    }
  }
  if (trails) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "trails") {
        filteredList.add(it.current);
      }
    }
  }
  if (expositions) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "expositions") {
        filteredList.add(it.current);
      }
    }
  }
  if (parks) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "parks") {
        filteredList.add(it.current);
      }
    }
  }
  if (sculptures) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "sculptures") {
        filteredList.add(it.current);
      }
    }
  }
  if (churches) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "churches") {
        filteredList.add(it.current);
      }
    }
  }
  if (mounds) {
    Iterator<Place> it = list.iterator;
    while (it.moveNext()) {
      if (it.current.placeType == "mounds") {
        filteredList.add(it.current);
      }
    }
  }

  return filteredList;
}

Future<List<Place>> fetchPlaceData() async {
  var url = Uri.parse('http://10.0.2.2:8081/places'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  PlaceCollection collection = PlaceCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list;
}

Future<http.Response> sendUserDataToServer(String name, String lastName, String email, String id) {
  var url = Uri.parse('http://10.0.2.2:8081/user/connected');

  return http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'first_name': name,
      'last_name': lastName,
      'email': email,
      'id': id,
    }),
  );
}

Future<http.Response> sendNewEventDataToServer(String eventName, String placeName, String link, String address, String city, String startDate, String public, String userId) {
  var url = Uri.parse('http://10.0.2.2:8081/user/event');

  return http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'event_name': eventName,
      'place_name': placeName,
      'link': link,
      'address': address,
      'city': city,
      'start_date': startDate,
      'public': public,
      'user_id': userId,
    }),
  );
}

Future<http.Response> sendNewPlaceDataToServer(String placeName, String placeType, String link, String address, String city, String public, String userId) {
  var url = Uri.parse('http://10.0.2.2:8081/user/place');

  return http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'place_name': placeName,
      'place_type': placeType,
      'link': link,
      'address': address,
      'city': city,
      'public': public,
      'user_id': userId,
    }),
  );
}

Future<List<Event>> fetchUserEventData(String userId) async {
  var url = Uri.parse('http://10.0.2.2:8081/user/events?userId=$userId'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  EventCollection collection = EventCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list;
}

Future<List<Place>> fetchUserPlaceData(String userId) async {
  var url = Uri.parse('http://10.0.2.2:8081/user/places?userId=$userId'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  PlaceCollection collection = PlaceCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list;
}

Future<Event> fetchEventViewData(String eventId) async {
  var url = Uri.parse('http://10.0.2.2:8081/eventview?eventId=$eventId'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  EventCollection collection = EventCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list.first;
}

Future<http.Response> sendChangedEventDataToServer(String eventId, String eventName, String placeName, String link, String address, String city, String startDate, String public) {
  var url = Uri.parse('http://10.0.2.2:8081/user/event/update');

  return http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'event_id': eventId,
      'event_name': eventName,
      'place_name': placeName,
      'link': link,
      'address': address,
      'city': city,
      'start_date': startDate,
      'public': public,
    }),
  );
}

void sendDeleteEventDataToServer(String eventId) async {
  var url = Uri.parse('http://10.0.2.2:8081/user/event/delete?eventId=$eventId'); //instead of localhost
  var response = await http.delete(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<Place> fetchPlaceViewData(String placeId) async {
  var url = Uri.parse('http://10.0.2.2:8081/placeview?placeId=$placeId'); //instead of localhost
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  List<dynamic> stringList = jsonDecode(response.body);
  PlaceCollection collection = PlaceCollection.fromJson(stringList);

  print('Parsed: ${collection.list.first.address}');

  return collection.list.first;
}

Future<http.Response> sendChangedPlaceDataToServer(String placeId, String placeName, String placeType, String link, String address, String city, String public) {
  var url = Uri.parse('http://10.0.2.2:8081/user/place/update');

  return http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'place_id': placeId,
      'place_name': placeName,
      'place_type': placeType,
      'link': link,
      'address': address,
      'city': city,
      'public': public,
    }),
  );
}

void sendDeletePlaceDataToServer(String placeId) async {
  var url = Uri.parse('http://10.0.2.2:8081/user/place/delete?placeId=$placeId'); //instead of localhost
  var response = await http.delete(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}