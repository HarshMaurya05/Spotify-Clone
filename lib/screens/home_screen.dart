import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/music_model.dart';
import '../screens/album_screen.dart';
import '../services/audio_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF121212),
            expandedHeight: 100,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Good Evening',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recently played section
                  _buildRecentlyPlayed(),
                  SizedBox(height: 30),

                  // Made for you section
                  _buildSectionHeader('Made for you'),
                  SizedBox(height: 16),
                  _buildHorizontalList(DummyData.playlists, isPlaylist: true),
                  SizedBox(height: 30),

                  // Popular albums section
                  _buildSectionHeader('Popular albums'),
                  SizedBox(height: 16),
                  _buildHorizontalList(DummyData.albums, isPlaylist: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyPlayed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently played',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final item = index < DummyData.albums.length
                ? DummyData.albums[index]
                : DummyData.playlists[index - DummyData.albums.length];

            return _buildRecentlyPlayedItem(item);
          },
        ),
      ],
    );
  }

  Widget _buildRecentlyPlayedItem(dynamic item) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF282828),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[800],
                child: Icon(Icons.music_note, color: Colors.white),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[800],
                child: Icon(Icons.music_note, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildHorizontalList(List<dynamic> items, {required bool isPlaylist}) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildHorizontalListItem(item, isPlaylist);
        },
      ),
    );
  }

  Widget _buildHorizontalListItem(dynamic item, bool isPlaylist) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          if (!isPlaylist) {
            // Navigate to album screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumScreen(album: item as Album),
              ),
            );
          } else {
            // Play first song from playlist
            final playlist = item as Playlist;
            if (playlist.songs.isNotEmpty) {
              AudioService().playSong(
                playlist.songs.first,
                playlist: playlist.songs,
              );
            }
          }
        },
        child: Container(
          width: 160,
          margin: EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[800],
                    child: Icon(Icons.music_note, color: Colors.white, size: 40),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[800],
                    child: Icon(Icons.music_note, color: Colors.white, size: 40),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (isPlaylist)
                Text(
                  (item as Playlist).description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              else
                Text(
                  (item as Album).artist,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}