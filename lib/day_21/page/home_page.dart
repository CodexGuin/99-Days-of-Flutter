import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninety_nine_days_of_flutter/day_21/data/convo_data.dart';
import 'package:ninety_nine_days_of_flutter/day_21/widgets/convo_list_tile.dart';

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
            expandedHeight: 125,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Telegram',
                style: GoogleFonts.lato(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: Convo().convos.length, (context, index) {
              final aConvo = Convo().convos[index];
              return ConvoListTile(
                convoName: aConvo.convoName,
                iconPath: aConvo.iconPath,
                unreadNum: aConvo.unreadNum,
                index: index,
                time: '12:31 PM',
                isMuted: aConvo.isMuted,
                latestMsg: aConvo.chatMsg[0].message,
                latestMsgSender: aConvo.chatMsg[0].sender,
                isGroup: aConvo.isGroup,
              );
            }),
          )
        ],
      ),
    );
  }
}
