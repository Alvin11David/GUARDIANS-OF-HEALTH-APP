import 'package:flutter/material.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isGridView = true;

  // Sample bookmark data
  final List<Map<String, dynamic>> _bookmarks = [
    {
      'title': 'What is AMR?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.orange, Colors.red],
      'additionalText': null,
    },
    {
      'title': 'Why is AMR a problem?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.purple, Colors.deepPurple],
      'additionalText': 'Longer hospital stays',
    },
    {
      'title': 'What is AMR?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.grey[300]!, Colors.grey[400]!],
      'additionalText': null,
    },
    {
      'title': 'What is AMR?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.green, Colors.teal],
      'additionalText': null,
    },
    {
      'title': 'Why is AMR a problem?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.blue, Colors.indigo],
      'additionalText': 'Longer hospital stays',
    },
    {
      'title': 'What is AMR?',
      'content': 'When bacteria, viruses, or fungi no longer respond to medicines',
      'gradient': [Colors.brown, Colors.orange],
      'additionalText': null,
    },
  ];

  List<Map<String, dynamic>> get _filteredBookmarks {
    if (_searchController.text.isEmpty) {
      return _bookmarks;
    }
    return _bookmarks.where((bookmark) {
      return bookmark['title'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
             bookmark['content'].toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  
                  // Right Icons
                  Row(
                    children: [
                      // Bookmark Icon
                      IconButton(
                        icon: const Icon(Icons.bookmark_outline, color: Colors.black),
                        onPressed: () {},
                      ),
                      
                      // Notification Icon
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined, color: Colors.black),
                        onPressed: () {},
                      ),
                      
                      // Profile Icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'BOOKMARKS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search Your Bookmark',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isGridView ? Icons.view_list : Icons.grid_view,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isGridView = !_isGridView;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bookmarks Grid
            Expanded(
              child: _filteredBookmarks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No bookmarks found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try adjusting your search terms',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: _isGridView
                          ? GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: _filteredBookmarks.length,
                              itemBuilder: (context, index) {
                                final bookmark = _filteredBookmarks[index];
                                return _buildBookmarkCard(bookmark);
                              },
                            )
                          : ListView.builder(
                              itemCount: _filteredBookmarks.length,
                              itemBuilder: (context, index) {
                                final bookmark = _filteredBookmarks[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: _buildBookmarkCard(bookmark, isList: true),
                                );
                              },
                            ),
                    ),
            ),
          ],
        ),
      ),
      
      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home_outlined, color: Colors.white, size: 24),
                const SizedBox(height: 4),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            // Book (Active)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.book, color: Colors.green, size: 24),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Book',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            // Chat
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
                const SizedBox(height: 4),
                const Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            // Profile
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_outline, color: Colors.white, size: 24),
                const SizedBox(height: 4),
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkCard(Map<String, dynamic> bookmark, {bool isList = false}) {
    return GestureDetector(
      onTap: () {
        // Navigate to details screen
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: bookmark['gradient'],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                bookmark['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              
              // Content
              Expanded(
                child: Text(
                  bookmark['content'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: isList ? 3 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              // Additional Text (if exists)
              if (bookmark['additionalText'] != null) ...[
                const SizedBox(height: 10),
                Text(
                  bookmark['additionalText'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
              
              // Bottom Actions
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bookmark Icon
                  const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 20,
                  ),
                  
                  // Share Icon
                  const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
