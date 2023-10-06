import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rhouze_web/utils/constants.dart';
import 'package:rhouze_web/providers/filter_provider.dart';
//import 'package:rhouze_web/screens/map_screen.dart';


class FiltersBottomBar extends StatefulWidget {
  final String pathScreen;
  const FiltersBottomBar({Key? key, this.pathScreen = ""}) : super(key: key);

  @override
  State<FiltersBottomBar> createState() => _FiltersBottomBarState();
}

class _FiltersBottomBarState extends State<FiltersBottomBar> {
  @override
  Widget build(BuildContext context) {

    final filterProvider = Provider.of<FilterProvider>( context );
    //final currentFilter = filterProvider.filterProvider;

    return Container(
            height: 75,
            color: kSecondaryColor,
            padding: const EdgeInsets.fromLTRB(22.0, 14.0, 22.0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white), 
                          //backgroundColor: Colors.white,
                          //shadowColor: Colors.grey[900],
                          //elevation: 6.0,
                        ),
                        onPressed: () {
                            setState(() {
                            FilterProvider().cleanFilter();
                            filterProvider.filterProvider = 'residential';
                            Provider.of<FilterProvider>(context, listen: false).filtersPropertyTypeHouse = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersLocation = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersStyleHouse = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersStyleCondo = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersBasement = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersAmmenities = [];
                            Provider.of<FilterProvider>(context, listen: false).filtersLocationTopbts = [];

                            /* if (widget.pathScreen == MapScreen.pathScreen) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'filters_screen', arguments: {'screenPath': MapScreen.pathScreen});
                            } else {
                              Navigator.pushNamed(context, 'filters_screen');
                            } */
                            Navigator.pushNamed(context, '/');
                            });
                        },
                        child: const Text(
                          "CLEAR", 
                          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0,), 
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kPrimaryColor), 
                          backgroundColor: kPrimaryColor
                        ),
                        onPressed: () {
                          /* if (widget.pathScreen == MapScreen.pathScreen) {
                            Navigator.pushNamed(context, MapScreen.pathScreen, arguments: {'filter': "true", 'mlsNumber': ''});
                          } else {
                            Navigator.pushNamed(context, 'filters_results_screen', arguments: 'Filtered results');
                          } */
                          Navigator.pushNamed(context, 'filters_results_screen', arguments: 'Filtered results');
                        },
                        child: const Text(
                          "SUBMIT", 
                          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),                
                  ]
                ),
                /* const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Filters: $currentFilter', style: const TextStyle(color: Colors.white,),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Prefs: ${Preferences.filtersClassIconsBt}', style: const TextStyle(color: Colors.white,),)
                  ],
                ), */
              ],
            ),
          
      /* padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 28.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: kSecondaryColor), 
                backgroundColor: Colors.white,
                shadowColor: Colors.grey[900],
                elevation: 6.0,
              ),
              onPressed: () {
                print(Preferences.filterRoomsLoggedOut);
                  // Respond to button press
                  setState(() {
                    Preferences.filterRoomsLoggedOut.clear();
                    Navigator.pushNamed(context, 'filters_screen');
                  });
              },
              child: const Text("CLEAR", style: TextStyle(color: kSecondaryColor),),
            ),
          ),
          const SizedBox(width: 8.0,), 
          Expanded(
            flex: 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: kPrimaryColor), 
                backgroundColor: kPrimaryColor
              ),
              onPressed: () {
                  // Respond to button press
                  Navigator.pushNamed(context, '/');
              },
              child: const Text("SAVE", style: TextStyle(color: Colors.white),),
            ),
          ),                
        ]
      ), */      
    );
  }
}