import 'package:flutter/material.dart';
//import 'package:rhouze_web/providers/filter_provider.dart';
//import 'package:rhouze_web/screens/map_screen.dart';
import 'package:rhouze_web/utils/constants.dart';
import 'package:rhouze_web/utils/search_delegate.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const loggedIn = true;

    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage('assets/r_logo_100x30.png'),),
                      //const Spacer(),
                      Image(image: AssetImage('assets/play&learn_logo100x30.png'),),
                    ],
                  ),
                  const SizedBox( height: 9.0, ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            /* onTap: () => displayDialog( context ),
                            child: const Image(image: AssetImage('assets/play&learn_logo108x37.png'),) */
                            onTap: () {
                              //Navigator.pushNamed(context, 'map_screen');
                              //_goToMapSearch(context);
                            },
                            //child: const Icon( Icons.map_outlined, color: kSecondaryColor, size: 26.0,),
                            child: const Row(
                              children: [
                                Icon( 
                                  Icons.map_outlined, 
                                  color: kSecondaryColor, 
                                  size: 30.0,
                                ),
                                Text(
                                  'Search by map', 
                                  style: TextStyle(color: Colors.white54, fontSize: 12.0, fontWeight: FontWeight.bold),
                                ),    
                              ],
                            )
                          ),
                          //const Text('Search by map', style: TextStyle(color: Colors.white54, fontSize: 12.0, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      GestureDetector(
                        /* onTap: () => displayDialog( context ),
                        child: const Image(image: AssetImage('assets/play&learn_logo108x37.png'),) */
                        onTap: () {
                          Navigator.pushNamed(context, 'filters_screen');
                        },
                        child: const Icon( Icons.tune_outlined, color: kSecondaryColor, size: 30.0,),
                      ),
                    ],
                  ),
                  const SizedBox( height: 8, ),
                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: InputSearchDelegate());
                      if ( loggedIn == true ) {
                        //showSearch(context: context, delegate: MovieSearchDelegate());
                      } else {
                        //Navigator.restorablePopAndPushNamed(context, '/');
                      }
                    },                    
                    child: const TextField(
                      readOnly: true,
                      style: TextStyle(color: Color(0xFF58595B)),
                      //initialValue: 'Address, Street Name or Listing#....',
                      decoration:  InputDecoration(
                        labelText: 'Address, Street Name or Listing#....',
                        constraints: BoxConstraints(maxHeight: 38.0),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.search_outlined,
                          color: Color(0xFF2E3191),
                          size: 30.0,
                        ),
                        enabled: false,                  
                      ),
                    ),
                  ),                    
                ],
              ),
            ),
            Container(
              height: 5,
              color: kSecondaryColor,
            )
          ],
        ),
      ),      
    );
  }

  /* void _goToMapSearch(BuildContext context) {
    FilterProvider().cleanFilter();
    Navigator.pushNamed(context, MapScreen.pathScreen, arguments: {'filter': "false", 'mlsNumber': ''});
  } */

  @override
  Size get preferredSize => const Size.fromHeight(130);
}