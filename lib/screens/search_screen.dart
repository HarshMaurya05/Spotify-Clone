import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spotify_clone/screens/miniplayer.dart';
import 'package:spotify_clone/screens/player_screen.dart';
import '../models/music_model.dart';
import '../services/audio_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isPlay = false;
  List<Song> _searchResults = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    // Simulate search delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _searchResults = DummyData.songs
            .where((song) =>
        song.title.toLowerCase().contains(query.toLowerCase()) ||
            song.artist.toLowerCase().contains(query.toLowerCase()) ||
            song.albumTitle.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Search header
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(onPressed: (){
                        setState(() {
                          AudioService().togglePlayPause();
                          setState(() {
                          });
                        });
                      }, icon: isPlay ? Icon(Icons.pause , color: Colors.white,) : Icon(Icons.play_arrow , color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 16),
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _searchController,
                      onChanged: _performSearch,
                      decoration: InputDecoration(
                        hintText: 'What do you want to listen to?',
                        prefixIcon: Icon(Icons.search, color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search results or browse categories
            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildBrowseCategories()
                  : _buildSearchResults(),
            ),
                 isPlay ? MiniPlayer() : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _buildBrowseCategories() {
    final categories = [
      {'title': 'Pop', 'color': Color(0xFF8400E7), 'icon': Icons.music_note},
      {'title': 'Hip-Hop', 'color': Color(0xFFE8115B), 'icon': Icons.headphones},
      {'title': 'Rock', 'color': Color(0xFF1E3264), 'icon': Icons.electric_bolt},
      {'title': 'Latin', 'color': Color(0xFFBC5900), 'icon': Icons.local_fire_department},
      {'title': 'R&B', 'color': Color(0xFF8D67AB), 'icon': Icons.favorite},
      {'title': 'Electronic', 'color': Color(0xFF148A08), 'icon': Icons.flash_on},
      {'title': 'Country', 'color': Color(0xFF777777), 'icon': Icons.nature},
      {'title': 'Jazz', 'color': Color(0xFF0D73EC), 'icon': Icons.piano},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse all',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  decoration: BoxDecoration(
                    color: category['color'] as Color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Text(
                          category['title'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Transform.rotate(
                          angle: 0.3,
                          child: Icon(
                            category['icon'] as IconData,
                            color: Colors.white.withOpacity(0.7),
                            size: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_isSearching) {
      return Center(
        child: CircularProgressIndicator(
          color: Color(0xFF1DB954),
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final song = _searchResults[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: song.imageUrl,
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
          title: Text(
            song.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            song.artist,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.grey[400],
          ),
          onTap: () {
            setState(() {
              if(isPlay){
                AudioService().stop();
                isPlay = false;
              }
              else{
                AudioService().playSong(song, playlist: _searchResults);
                isPlay = true;
              }
            });

          },
        );
      },
    );
  }
}