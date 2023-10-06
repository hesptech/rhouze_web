import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rhouze_web/providers/repliers_provider.dart';
import 'package:rhouze_web/providers/filter_provider.dart';

import 'package:rhouze_web/widgets/cards_slider_hor.dart';
import 'package:rhouze_web/widgets/filters_status_bt.dart';
import 'package:rhouze_web/utils/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final repliersProvider = Provider.of<RepliersProvider>(context);
    final repliersStatusProperties = Provider.of<FilterProvider>(context).filtersStatusProperties;

    return Scaffold(
      appBar: AppBar(
        //title: const Text('Rhouze Web POC (prove of concept) & MVP (minimum viable product)'),
        title: const Text('Rhouze Web'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: InputSearchDelegate());
            },
            icon: const Icon(
              Icons.search_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'filters_screen');
            },
            icon: const Icon(
              Icons.tune_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox( height: 45,),

                CardsSliderHor(
                  listing: repliersProvider.onDisplayHouses,
                  title: 'HOUSE Listings',
                  onNextPage: () => repliersProvider.getDisplayHouses(repliersStatusProperties),
                  onInitPage: () => repliersProvider.initGetDisplay(repliersStatusProperties),
                ),

                CardsSliderHor(
                  listing: repliersProvider.onDisplayCondo,
                  title: 'CONDO Listings',
                  onNextPage: () => repliersProvider.getDisplayCondo(repliersStatusProperties),
                  onInitPage: () => repliersProvider.initGetDisplay(repliersStatusProperties),
                ),

              ],
            ),
          ),
          const FiltersStatusBt(),
        ],
      ),
    );
  }
}