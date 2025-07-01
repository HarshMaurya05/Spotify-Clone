import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/music_model.dart';
import '../services/audio_service.dart';

class AlbumScreen extends StatefulWidget {
  final Album album;

  const AlbumScreen({Key? key, required this.album}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.offset < 200;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar with Album Cover
          SliverAppBar(
            backgroundColor: Color(0xFF121212),
            expandedHeight: 400,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF404040),
                      Color(0xFF121212),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Album Cover
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: widget.album.imageUrl,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey[800],
                            child: Icon(Icons.album, color: Colors.white, size: 80),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey[800],
                            child: Icon(Icons.album, color: Colors.white, size: 80),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Album Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.album.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Artist Name
                    Text(
                      widget.album.artist,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Album Info
                    Text(
                      'Album • ${widget.album.artist} • ${widget.album.songs.length} songs',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Controls and Song List
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Play Controls
                  Row(
                    children: [
                      // Shuffle
                      Icon(
                        Icons.shuffle,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                      Spacer(),

                      // Play Button
                      GestureDetector(
                        onTap: () {
                          if (widget.album.songs.isNotEmpty) {
                            AudioService().playSong(
                              widget.album.songs.first,
                              playlist: widget.album.songs,
                            );
                          }
                        },
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Color(0xFF1DB954),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                      Spacer(),

                      // Options
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Album Actions
                  Row(
                    children: [
                      // Heart (Like)
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                      SizedBox(width: 24),

                      // Download
                      Icon(
                        Icons.download_outlined,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                      SizedBox(width: 24),

                      // Share
                      Icon(
                        Icons.share_outlined,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                      Spacer(),

                      // Add to Library
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Song List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final song = widget.album.songs[index];
                return _buildSongItem(song, index);
              },
              childCount: widget.album.songs.length,
            ),
          ),

          // Bottom Spacing
          SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildSongItem(Song song, int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 32,
        alignment: Alignment.center,
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: Text(
        song.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        song.artist,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            song.duration as String,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.more_vert,
            color: Colors.grey[400],
            size: 20,
          ),
        ],
      ),
      onTap: () {
        AudioService().playSong(
          song,
          playlist: widget.album.songs,
        );
      },
    );
  }
}