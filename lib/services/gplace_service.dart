import 'package:http/http.dart' as http;
import '../models/place_model.dart';
import 'dart:async';
import 'dart:convert';

class LocationService {
  static final _locationService = new LocationService();

  static LocationService get() {
    return _locationService;
  }
  final String url =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=33.889339,35.476214&radius=1500&key=AIzaSyBGh307Au_bmV_1dXXAJ7MYI9BmzVXxEDQ";

  Future<List<PlaceDetail>> getNearbyPlaces() async {
    var reponse = await http.get(url, headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    data.forEach((f) =>
        places.add(new PlaceDetail(f["place_id"], f["name"],
            f["icon"], f["vicinity"])));

    return places;
  }
//reviews.map((f)=> new Review.fromMap(f)).toList()
  }

