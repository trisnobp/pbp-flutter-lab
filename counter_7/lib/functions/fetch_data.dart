import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/models/my_watch_list.dart';

// Fungsi untuk fetch data dari internet
Future<List<MyWatchList>> fetchWatchList() async {
    var url =
        Uri.parse("https://lab1-assignment.herokuapp.com/mywatchlist/json/");
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    });

    // Melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Konversi data json menjadi MyWatchList object
    List<MyWatchList> listMyWatchList = [];
    for (var i in data) {
      if (i != null) {
        listMyWatchList.add(MyWatchList.fromJson(i));
      }
    }

    return listMyWatchList;
  }