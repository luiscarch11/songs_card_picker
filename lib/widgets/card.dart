import 'dart:math';

import 'package:cards_animation/models/song.dart';
import 'package:cards_animation/song_details_page.dart';
import 'package:cards_animation/widgets/song_image.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.song,
    required this.nextSong,
    required this.isTappable,
  }) : super(key: key);
  final Song song;
  final Song? nextSong;
  final bool isTappable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SonDetailsPage(
              song: song,
              nextSong: nextSong,
            ),
          ),
        );
      },
      child: Hero(
        flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) =>
            VerticalRotationTransition(
          turns: animation,
          child: SongImageWidget(
            albumPhotoUrl: song.albumPhotoUrl,
          ),
        ),
        tag: song.id,
        child: SongImageWidget(
          albumPhotoUrl: song.albumPhotoUrl,
        ),
      ),
    );
  }
}

class VerticalRotationTransition extends AnimatedWidget {
  const VerticalRotationTransition({required this.turns, required this.child})
      : super(
          listenable: turns,
        );
  final Animation<double> turns;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, .002)
        ..rotateX(turns.value * 4 * pi),
      child: child,
    );
  }
}
