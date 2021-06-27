import 'package:flutter/material.dart';

class SongImageWidget extends StatelessWidget {
  const SongImageWidget({
    Key? key,
    required this.albumPhotoUrl,
  }) : super(key: key);
  final String albumPhotoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          albumPhotoUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
