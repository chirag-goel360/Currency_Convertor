import 'dart:convert';
import 'package:http/http.dart' as http;

// Get Your API Key from "https://free.currconv.com/"
String key = "e977bc17897a573bfe0b";

class FetchData {
  Future<List<String>> getCurrencies() async {
    String url = "https://free.currconv.com/api/v7/currencies?apiKey=";
    url += key;
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      var jsonBody = json.decode(
        response.body,
      );
      var currencyList = jsonBody['results'];
      List<String> currencies = currencyList.keys.toList();
      return currencies;
    } else {
      throw Exception(
        "Failed to Load Data",
      );
    }
  }

  Future<double> getRates(String from, String to) async {
    String url = "https://free.currconv.com/api/v7/convert?q=";
    url += from + "_" + to;
    url += "&compact=ultra&apiKey=" + key;
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      var jsonBody = json.decode(
        response.body,
      );
      String value = from + "_" + to;
      var rates = jsonBody[value];
      return rates;
    } else {
      throw Exception(
        "Failed to Load Data",
      );
    }
  }
}
