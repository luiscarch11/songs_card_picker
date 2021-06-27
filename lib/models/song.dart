class Song {
  const Song({
    required this.id,
    required this.name,
    required this.groupName,
    required this.albumPhotoUrl,
  });
  final String name;
  final int id;
  final String groupName;
  final String albumPhotoUrl;
}

const songs = [
  Song(
    id: 1,
    name: 'Bohemian Rhapsody',
    groupName: 'Queen',
    albumPhotoUrl:
        'https://images-na.ssl-images-amazon.com/images/I/71WVq7VqUkL._SY355_.jpg',
  ),
  Song(
    id: 2,
    name: 'Bohemian Rhapsody',
    groupName: 'Queen',
    albumPhotoUrl:
        'https://images-na.ssl-images-amazon.com/images/I/51INJ7S51uL._SY355_.jpg',
  ),
  Song(
    id: 3,
    name: 'Bohemian Rhapsody',
    groupName: 'Queen',
    albumPhotoUrl:
        'https://images-na.ssl-images-amazon.com/images/I/71WVq7VqUkL._SY355_.jpg',
  ),
];
