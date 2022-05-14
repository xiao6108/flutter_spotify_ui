// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12.0),
                ),
                const SizedBox(height: 12.0),
                Text(playlist.name,
                    style: Theme.of(context).textTheme.headline2),
                const SizedBox(height: 16.0),
                Text(playlist.description,
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 16.0),
                Text(
                    "Create by ${playlist.creator} · ${playlist.songs.length} songs, ${playlist.duration}",
                    style: Theme.of(context).textTheme.subtitle1)
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        _PlaylistButton(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButton extends StatelessWidget {
  final String followers;

  const _PlaylistButton({
    Key? key,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Theme.of(context).accentColor,
                //primary文字顏色
                primary: Theme.of(context).iconTheme.color,
                textStyle: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontSize: 12.0, letterSpacing: 2.0)),
            onPressed: () {},
            child: const Text('PLAY')),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        //Spacer可以加中間空格
        const Spacer(),
        Text(
          'FOLLOWER\n$followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
