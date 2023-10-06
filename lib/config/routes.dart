import 'package:flutter/material.dart';
import 'package:rhouze_web/screens/screens.dart';
//import 'package:flutter_black_white/screens/map_property_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  //'/': ( _ ) => const HomeScreen(),
  //MapScreen.pathScreen: ( _ ) => const MapScreen(),
  //MapPropertyScreen.pathScreen: ( _ ) => const MapPropertyScreen(),
  'filters_screen': ( _ ) => const FiltersScreen(),
   'filters_results_screen': ( _ ) => const FiltersResultsScreen(),
  /*
  'login_screen': ( _ ) => const LoginScreen(),
  'card_details_full_screen': ( _ ) => const CardDetailsFullScreen(),
  'card_details_full_sold_screen': ( _ ) => const CardDetailsFullSoldScreen(),
  'card_images_screen': ( _ ) => const CardImagesScreen(),
  'card_details_screen': ( _ ) => const CardDetailsScreen(), */
};
