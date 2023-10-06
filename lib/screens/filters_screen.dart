import 'package:flutter/material.dart';

import 'package:rhouze_web/utils/constants.dart';
import 'package:rhouze_web/modules/filters/filters.dart';
//import 'package:rhouze_web/utils/shared_preferences.dart';
//import 'package:rhouze_web/utils/widgets_formatting.dart';
//import 'package:rhouze_web/screens/map_screen.dart';



class FiltersScreen extends StatelessWidget {
  const FiltersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var pathArgument = _checkArguments(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
            height: 5.0,
            color: kSecondaryColor,
          )
        ),
        elevation: 0.0,
        centerTitle: true,
        /* leading: IconButton(
          onPressed: () { 
            if (pathArgument == MapScreen.pathScreen) {
              if (Preferences.isCleanFilter) {
                Navigator.pushNamed(context, MapScreen.pathScreen, arguments: {'filter': "false", 'mlsNumber': ''});
                Preferences.isCleanFilter = false;
              } else {
                Navigator.of(context).pop();
              }
            } else {
              Navigator.pushNamed(context, '/');
            }
          }, 
          icon: const Icon(Icons.close_outlined),
        ), */
        title: const Text('Personalize Listing'),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //child: Placeholder(),
        child: Column(
          children: <Widget>[
            FiltersPriceSlider(),
            /* const FiltersClassIconBt(),
            const SizedBox( height: 28.0,),
            const GreenDivider(),
            const FiltersPropertyType(),
            const GreenDivider(),
            pathArgument != MapScreen.pathScreen ? const FiltersLocation() : Container(),
            const GreenDivider(),
            const FiltersBathbedpark(),
            const FiltersMore(), */
          ],
        ),
      ),
      bottomNavigationBar: FiltersBottomBar(pathScreen: pathArgument),
    );
  }

  String _checkArguments(BuildContext context) {
    //final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    //return arguments["screenPath"].toString() == MapScreen.pathScreen ? MapScreen.pathScreen : "/";
    return "/";
    
  }
}
