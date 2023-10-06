//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rhouze_web/config/environment.dart';
import 'package:rhouze_web/models/models.dart';


class RepliersFilters extends ChangeNotifier {

  String citySearchParam = '';
  List<Listing> onDisplayFilters = [];
  int onCount = 0;
  int _displayPageFilters = 0;
  bool isLoading = false;
  bool loaded = false;


  RepliersFilters( this.citySearchParam ) {
    citySearchParam == 'toronto' ? 'toronto' : citySearchParam ;
  }

  // FILTERS
  Future<String> _getJsonDataFilters( String endPoint, Map<String, dynamic> valuesParams, [int page = 1] ) async {
    endPoint = 'listings';
    final url = Uri.https( kBaseUrl, endPoint, valuesParams);
    //print( url );

    String envApiKey = kRepliersApiKey;

    Map<String, String>? headers = { 'REPLIERS-API-KEY': envApiKey };

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url, headers: headers);
    //return response.body;
    try {
      if ( response.statusCode == 200 ) {
        return response.body;
      } else {
        return processResponse(response);
      }
    } catch (e) {
      //print('Error: $e');
      return 'Error: $e';
    }
  }


  getDisplayFilters(Map<String, dynamic> filtersResults) async {

    if (isLoading) return;
    isLoading = true;

    _displayPageFilters++;
    filtersResults['pageNum'] = _displayPageFilters.toString(); 

    final jsonData = await _getJsonDataFilters('listings', filtersResults, _displayPageFilters); 

    final nowPlayingResponse = ResponseBody.fromJson(jsonData);

    onDisplayFilters = [ ...onDisplayFilters, ...nowPlayingResponse.listings];
    onCount = nowPlayingResponse.count;
    loaded = true;
    notifyListeners();
    isLoading = false;
  }

  initGetDisplay(Map<String, dynamic> filtersResults) {
    _displayPageFilters = 0;
    onDisplayFilters = [];
    onCount = 0;
    loaded = false;
    getDisplayFilters(filtersResults);
  }
}
