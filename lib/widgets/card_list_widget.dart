import 'dart:math';

import 'package:cards_animation/widgets/card.dart';
import 'package:flutter/material.dart';

import 'package:cards_animation/models/song.dart';

class CardListWidget extends StatefulWidget {
  const CardListWidget({
    Key? key,
    required this.songs,
  }) : super(key: key);
  final List<Song> songs;

  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController controller;
  Tween<double> x = Tween<double>(
    begin: 15,
    end: 60,
  );
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = x.animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanEnd: (details) {
          setState(() {
            isExpanded ? controller.reverse() : controller.forward();
            isExpanded = !isExpanded;
          });
        },
        child: Container(
          child: Stack(children: [
            for (var index = 0; index < songs.length; index++)
              Column(
                children: [
                  SizedBox(
                    height: animation.value * index,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, .002)
                      ..rotateX(pi * controller.value * .09),
                    child: Align(
                      alignment: Alignment.center,
                      child: CardWidget(
                        isTappable: isExpanded,
                        song: songs[index],
                        nextSong: songs.last == songs[index]
                            ? null
                            : songs[index + 1],
                      ),
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
  }
}
