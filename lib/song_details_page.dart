import 'package:cards_animation/models/song.dart';

import 'package:cards_animation/widgets/song_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SonDetailsPage extends StatelessWidget {
  const SonDetailsPage({
    Key? key,
    required this.song,
    required this.nextSong,
  }) : super(key: key);
  final Song song;
  final Song? nextSong;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Hero(
              tag: song.id,
              child: SongImageWidget(
                albumPhotoUrl: song.albumPhotoUrl,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              song.name,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              song.groupName,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  sliderTheme: SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                  ),
                ),
                child: Slider(
                  activeColor: Colors.red,
                  value: 4,
                  onChanged: (_) {},
                  max: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.shuffle),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.pause,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                  Icon(CupertinoIcons.repeat),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Spacer(),
            TweenAnimationBuilder<double>(
              duration: const Duration(
                milliseconds: 800,
              ),
              tween: Tween<double>(
                begin: 30,
                end: 0,
              ),
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.translate(
                  offset: Offset(0, value),
                  child: Container(
                    padding: const EdgeInsets.all(
                      25.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: nextSong == null
                        ? Text('This is the last song!')
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Next song',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        nextSong!.albumPhotoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      '${nextSong!.name} - ${nextSong!.groupName}'),
                                  Spacer(),
                                  Text('❤'),
                                ],
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
