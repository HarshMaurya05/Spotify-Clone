class Song {
  final String id;
  final String title;
  final String artist;
  final String albumTitle;
  final String imageUrl;
  final String audioUrl;
  final Duration duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumTitle,
    required this.imageUrl,
    required this.audioUrl,
    required this.duration,
  });
}

class Album {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final List<Song> songs;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.songs,
  });
}

class Playlist {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Song> songs;

  Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.songs,
  });
}

// Dummy data for the app
class DummyData {
  static List<Song> songs = [
    Song(
      id: '1',
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      albumTitle: 'After Hours',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      duration: Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: '2',
      title: 'Watermelon Sugar',
      artist: 'Harry Styles',
      albumTitle: 'Fine Line',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273adcaab83ce98cb4e9cb00e90',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      duration: Duration(minutes: 2, seconds: 54),
    ),
    Song(
      id: '3',
      title: 'Levitating',
      artist: 'Dua Lipa',
      albumTitle: 'Future Nostalgia',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273ef8cf61d5a1de6f8de99e639',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
      duration: Duration(minutes: 3, seconds: 23),
    ),
    Song(
      id: '4',
      title: 'Good 4 U',
      artist: 'Olivia Rodrigo',
      albumTitle: 'SOUR',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
      duration: Duration(minutes: 2, seconds: 58),
    ),
    Song(
      id: '5',
      title: 'Stay',
      artist: 'The Kid LAROI & Justin Bieber',
      albumTitle: 'Stay',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e98de5d9e1e6c6c8e9e2e2e2',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
      duration: Duration(minutes: 2, seconds: 21),
    ),
    Song(
      id: '6',
      title: 'Heat Waves',
      artist: 'Glass Animals',
      albumTitle: 'Dreamland',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273b0b1b6b7b7b7b7b7b7b7b7b7',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
      duration: Duration(minutes: 3, seconds: 58),
    ),
    Song(
      id: '7',
      title: 'Peaches',
      artist: 'Justin Bieber ft. Daniel Caesar, Giveon',
      albumTitle: 'Justice',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c8b0c0c0c0c0c0c0c0c0c0c0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
      duration: Duration(minutes: 3, seconds: 18),
    ),
    Song(
      id: '8',
      title: 'Save Your Tears',
      artist: 'The Weeknd & Ariana Grande',
      albumTitle: 'After Hours',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
      duration: Duration(minutes: 3, seconds: 35),
    ),
    Song(
      id: '9',
      title: 'Positions',
      artist: 'Ariana Grande',
      albumTitle: 'Positions',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273f0f0f0f0f0f0f0f0f0f0f0f0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3',
      duration: Duration(minutes: 2, seconds: 52),
    ),
    Song(
      id: '10',
      title: 'Mood',
      artist: '24kGoldn ft. iann dior',
      albumTitle: 'El Dorado',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e0e0e0e0e0e0e0e0e0e0e0e0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
      duration: Duration(minutes: 2, seconds: 20),
    ),
    Song(
      id: '11',
      title: 'Drivers License',
      artist: 'Olivia Rodrigo',
      albumTitle: 'SOUR',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3',
      duration: Duration(minutes: 4, seconds: 2),
    ),
    Song(
      id: '12',
      title: 'Deja Vu',
      artist: 'Olivia Rodrigo',
      albumTitle: 'SOUR',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-12.mp3',
      duration: Duration(minutes: 3, seconds: 35),
    ),
    Song(
      id: '13',
      title: 'Industry Baby',
      artist: 'Lil Nas X & Jack Harlow',
      albumTitle: 'MONTERO',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c6c6c6c6c6c6c6c6c6c6c6c6',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',
      duration: Duration(minutes: 3, seconds: 32),
    ),
    Song(
      id: '14',
      title: 'Kiss Me More',
      artist: 'Doja Cat ft. SZA',
      albumTitle: 'Planet Her',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273d0d0d0d0d0d0d0d0d0d0d0d0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3',
      duration: Duration(minutes: 3, seconds: 28),
    ),
    Song(
      id: '15',
      title: 'Montero',
      artist: 'Lil Nas X',
      albumTitle: 'MONTERO',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c6c6c6c6c6c6c6c6c6c6c6c6',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-15.mp3',
      duration: Duration(minutes: 2, seconds: 17),
    ),
    Song(
      id: '16',
      title: 'Bad Habits',
      artist: 'Ed Sheeran',
      albumTitle: '=',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e5e5e5e5e5e5e5e5e5e5e5e5',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3',
      duration: Duration(minutes: 3, seconds: 51),
    ),
    Song(
      id: '17',
      title: 'Butter',
      artist: 'BTS',
      albumTitle: 'Butter',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273f0f0f0f0f0f0f0f0f0f0f0f0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-17.mp3',
      duration: Duration(minutes: 2, seconds: 44),
    ),
    Song(
      id: '18',
      title: 'Shivers',
      artist: 'Ed Sheeran',
      albumTitle: '=',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e5e5e5e5e5e5e5e5e5e5e5e5',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-18.mp3',
      duration: Duration(minutes: 3, seconds: 27),
    ),
    Song(
      id: '19',
      title: 'Ghost',
      artist: 'Justin Bieber',
      albumTitle: 'Justice',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c8b0c0c0c0c0c0c0c0c0c0c0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-19.mp3',
      duration: Duration(minutes: 2, seconds: 33),
    ),
    Song(
      id: '20',
      title: 'My Universe',
      artist: 'Coldplay X BTS',
      albumTitle: 'Music Of The Spheres',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273a0a0a0a0a0a0a0a0a0a0a0a0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-20.mp3',
      duration: Duration(minutes: 3, seconds: 48),
    ),
    Song(
      id: '21',
      title: 'Flowers',
      artist: 'Miley Cyrus',
      albumTitle: 'Endless Summer Vacation',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273b1b1b1b1b1b1b1b1b1b1b1b1',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-21.mp3',
      duration: Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: '22',
      title: 'As It Was',
      artist: 'Harry Styles',
      albumTitle: 'Harry\'s House',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273b2b2b2b2b2b2b2b2b2b2b2b2',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-22.mp3',
      duration: Duration(minutes: 2, seconds: 47),
    ),
    Song(
      id: '23',
      title: 'About Damn Time',
      artist: 'Lizzo',
      albumTitle: 'Special',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c3c3c3c3c3c3c3c3c3c3c3c3',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-23.mp3',
      duration: Duration(minutes: 3, seconds: 12),
    ),
    Song(
      id: '24',
      title: 'Running Up That Hill',
      artist: 'Kate Bush',
      albumTitle: 'Hounds of Love',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273d4d4d4d4d4d4d4d4d4d4d4d4',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-24.mp3',
      duration: Duration(minutes: 4, seconds: 58),
    ),
    Song(
      id: '25',
      title: 'Break My Soul',
      artist: 'Beyoncé',
      albumTitle: 'Renaissance',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273e6e6e6e6e6e6e6e6e6e6e6e6',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-25.mp3',
      duration: Duration(minutes: 4, seconds: 38),
    ),
    Song(
      id: '26',
      title: 'Unholy',
      artist: 'Sam Smith ft. Kim Petras',
      albumTitle: 'Gloria',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273f7f7f7f7f7f7f7f7f7f7f7f7',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-26.mp3',
      duration: Duration(minutes: 2, seconds: 36),
    ),
    Song(
      id: '27',
      title: 'Anti-Hero',
      artist: 'Taylor Swift',
      albumTitle: 'Midnights',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273g8g8g8g8g8g8g8g8g8g8g8g8',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-27.mp3',
      duration: Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: '28',
      title: 'Calm Down',
      artist: 'Rema & Selena Gomez',
      albumTitle: 'Rave & Roses',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273h9h9h9h9h9h9h9h9h9h9h9h9',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-28.mp3',
      duration: Duration(minutes: 3, seconds: 59),
    ),
    Song(
      id: '29',
      title: 'Lavender Haze',
      artist: 'Taylor Swift',
      albumTitle: 'Midnights',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273g8g8g8g8g8g8g8g8g8g8g8g8',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-29.mp3',
      duration: Duration(minutes: 3, seconds: 22),
    ),
    Song(
      id: '30',
      title: 'Tití Me Preguntó',
      artist: 'Bad Bunny',
      albumTitle: 'Un Verano Sin Ti',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273i0i0i0i0i0i0i0i0i0i0i0i0',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-30.mp3',
      duration: Duration(minutes: 4, seconds: 2),
    ),
  ];

  static List<Album> albums = [
    Album(
      id: '1',
      title: 'After Hours',
      artist: 'The Weeknd',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36',
      songs: [songs[0], songs[7]],
    ),
    Album(
      id: '2',
      title: 'Fine Line',
      artist: 'Harry Styles',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273adcaab83ce98cb4e9cb00e90',
      songs: [songs[1]],
    ),
    Album(
      id: '3',
      title: 'Future Nostalgia',
      artist: 'Dua Lipa',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273ef8cf61d5a1de6f8de99e639',
      songs: [songs[2]],
    ),
    Album(
      id: '4',
      title: 'SOUR',
      artist: 'Olivia Rodrigo',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
      songs: [songs[3], songs[10], songs[11]],
    ),
    Album(
      id: '5',
      title: 'Justice',
      artist: 'Justin Bieber',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273c8b0c0c0c0c0c0c0c0c0c0c0',
      songs: [songs[6], songs[18]],
    ),
    Album(
      id: '6',
      title: 'Dreamland',
      artist: 'Glass Animals',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b273b0b1b6b7b7b7b7b7b7b7b7b7',
      songs: [songs[5]],
    ),
  ];

  static List<Playlist> playlists = [
    Playlist(
      id: '1',
      title: 'Today\'s Top Hits',
      description: 'The most played songs right now',
      imageUrl: 'https://i.scdn.co/image/ab67706f00000002ca5a7517156021292e5663a6',
      songs: songs.take(10).toList(),
    ),
    Playlist(
      id: '2',
      title: 'Pop Rising',
      description: 'Pop music on the rise',
      imageUrl: 'https://i.scdn.co/image/ab67706f000000026f5b8a1a0b9f9a4b4f7a7b6a',
      songs: songs.skip(10).take(10).toList(),
    ),
    Playlist(
      id: '3',
      title: 'Chill Hits',
      description: 'Kick back to the best new and recent chill hits',
      imageUrl: 'https://i.scdn.co/image/ab67706f000000021b9c9c1c8b9b8b9b8b9b8b9b',
      songs: songs.skip(20).take(10).toList(),
    ),
  ];

  static List<Song> likedSongs = songs.take(15).toList();
}