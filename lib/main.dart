import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rhouze_web/screens/home_screen.dart';


import 'package:provider/provider.dart';


import 'package:rhouze_web/providers/repliers_provider.dart';
import 'package:rhouze_web/providers/repliers_filters.dart';
import 'package:rhouze_web/providers/repliers_search.dart';
import 'package:rhouze_web/providers/filter_provider.dart';


import 'package:rhouze_web/utils/shared_preferences.dart';
import 'package:rhouze_web/config/config.dart';

void main() async {
  //await dotenv.load();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(const AppState()); 
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => FilterProvider() ),
        ChangeNotifierProvider( create: (_) => RepliersProvider(Preferences.filtersStatusProperties), lazy: false ),
        ChangeNotifierProvider( create: (_) => RepliersFilters('toronto ALL') ),
        //ChangeNotifierProvider( create: (_) => RepliersListingMls() ),
        ChangeNotifierProvider( create: (_) => RepliersSearch(), ),
        //ChangeNotifierProvider( create: (_) => MapListProvider() ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'RHOUZE Web',
      //theme: theme,
      initialRoute: '/',
      routes: customRoutes,
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}