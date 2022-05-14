// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';

class Tracklist extends StatelessWidget {
  final List<Song> tracks;
  const Tracklist({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        showCheckboxColumn: false,
        columns: [
          const DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(label: Icon(Icons.access_time))
        ],
        rows: tracks.map((e) {
          // 要跟監聽說那個被選了 make bool
          final selected =
              context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);

          return DataRow(
            cells: [
              DataCell(
                Text(e.title, style: textStyle),
              ),
              DataCell(
                Text(e.artist, style: textStyle),
              ),
              DataCell(
                Text(e.album, style: textStyle),
              ),
              DataCell(
                Text(e.duration, style: textStyle),
              ),
            ],
            selected: selected,
            // Booling (_)
            onSelectChanged: (_) =>
                context.read<CurrentTrackModel>().selectTrack(e),
          );
        }).toList());
  }
}
