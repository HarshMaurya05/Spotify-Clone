import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/music_model.dart';
import '../services/audio_service.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFF1DB954),
                    child: Text(
                      'U',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Your Library',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 16),
                  Icon(Icons.add, color: Colors.white),
                ],
              ),
            ),

            // Filter chips
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('Recently played', true),
                    SizedBox(width: 8),
                    _buildFilterChip('Made for you', false),
                    SizedBox(width: 8),
                    _buildFilterChip('Downloaded', false),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Library content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Liked Songs
                  _buildLibraryItem(
                    icon: Icons.favorite,
                    iconColor: Color(0xFF1DB954),
                    title: 'Liked Songs',
                    subtitle: '${DummyData.likedSongs.length} songs',
                    onTap: () {
                      // Play liked songs
                      if (DummyData.likedSongs.isNotEmpty) {
                        AudioService().playSong(
                          DummyData.likedSongs.first,
                          playlist: DummyData.likedSongs,
                        );
                      }
                    },
                  ),

                  // Downloaded music
                  _buildLibraryItem(
                    icon: Icons.download,
                    iconColor: Color(0xFF1DB954),
                    title: 'Downloaded Music',
                    subtitle: 'No downloaded music',
                    onTap: () {},
                  ),

                  SizedBox(height: 20),

                  // Recent playlists and albums
                  Text(
                    'Made by Spotify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Playlists
                  ...DummyData.playlists.map((playlist) => _buildPlaylistItem(playlist)),

                  SizedBox(height: 20),

                  Text(
                    'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Albums
                  ...DummyData.albums.map((album) => _buildAlbumItem(album)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF1DB954) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Color(0xFF1DB954) : Colors.grey,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildLibraryItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildPlaylistItem(Playlist playlist) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: playlist.imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[800],
            child: Icon(Icons.queue_music, color: Colors.white),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[800],
            child: Icon(Icons.queue_music, color: Colors.white),
          ),
        ),
      ),
      title: Text(
        playlist.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        'Playlist • ${playlist.songs.length} songs',
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      onTap: () {
        if (playlist.songs.isNotEmpty) {
          AudioService().playSong(
            playlist.songs.first,
            playlist: playlist.songs,
          );
        }
      },
    );
  }

  Widget _buildAlbumItem(Album album) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: album.imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[800],
            child: Icon(Icons.album, color: Colors.white),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[800],
            child: Icon(Icons.album, color: Colors.white),
          ),
        ),
      ),
      title: Text(
        album.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        'Album • ${album.artist}',
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      onTap: () {
        if (album.songs.isNotEmpty) {
          AudioService().playSong(
            album.songs.first,
            playlist: album.songs,
          );
        }
      },
    );
  }
}