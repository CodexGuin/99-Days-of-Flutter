import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninety_nine_days_of_flutter/day_22/data/convo_data.dart';
import 'package:ninety_nine_days_of_flutter/day_22/widgets/convo_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              leading: const Icon(Icons.menu_rounded),
              centerTitle: true,
              pinned: true,
              floating: true,
              backgroundColor: const Color(0xFF242426),
              expandedHeight: 175,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('assets/images/day_20/p2.jpg',
                      fit: BoxFit.cover),
                  title: Text('Telegram', style: GoogleFonts.lato()))),
          Consumer<Convo>(
            builder: (context, convoProvider, child) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ConvoListTile(
                        aConvo: convoProvider.convos[index], index: index);
                  },
                  childCount: convoProvider.convos.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
