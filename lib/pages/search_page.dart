import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';
import 'package:tifmoroli_onelife_app/components/lesson_pdfview.dart';

class SearchPage extends StatefulWidget {
  final List<Lessons> nblessonsList;
  final List<Lessons> mtlessonsList;
  final List<Lessons> ldlessonsList;

  const SearchPage({
    super.key,
    required this.nblessonsList,
    required this.mtlessonsList,
    required this.ldlessonsList,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late FocusNode _focusNode;
  List<Map<String, dynamic>> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode = FocusNode();
    
    // Auto-focus and show keyboard
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase();
    
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    final results = <Map<String, dynamic>>[];

    // Search in New Believers Lessons
    for (int i = 0; i < widget.nblessonsList.length; i++) {
      final lesson = widget.nblessonsList[i];
      if (lesson.lessonTitle.toLowerCase().contains(query) ||
          lesson.lessonNumber.toString().contains(query)) {
        results.add({
          'lesson': lesson,
          'category': 'New Believers',
          'index': i,
          'list': widget.nblessonsList,
        });
      }
    }

    // Search in Mentoring Lessons
    for (int i = 0; i < widget.mtlessonsList.length; i++) {
      final lesson = widget.mtlessonsList[i];
      if (lesson.lessonTitle.toLowerCase().contains(query) ||
          lesson.lessonNumber.toString().contains(query)) {
        results.add({
          'lesson': lesson,
          'category': 'Mentoring',
          'index': i,
          'list': widget.mtlessonsList,
        });
      }
    }

    // Search in Leadership Lessons
    for (int i = 0; i < widget.ldlessonsList.length; i++) {
      final lesson = widget.ldlessonsList[i];
      if (lesson.lessonTitle.toLowerCase().contains(query) ||
          lesson.lessonNumber.toString().contains(query)) {
        results.add({
          'lesson': lesson,
          'category': 'Leadership',
          'index': i,
          'list': widget.ldlessonsList,
        });
      }
    }

    setState(() => _searchResults = results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search lessons...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          cursorColor: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _searchResults.isEmpty && _searchController.text.isEmpty
          ? Center(
              child: Text(
                'Enter a lesson title or number to search',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            )
          : _searchResults.isEmpty
              ? Center(
                  child: Text(
                    'No results found for "${_searchController.text}"',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final result = _searchResults[index];
                    final lesson = result['lesson'] as Lessons;
                    final category = result['category'] as String;
                    final lessonIndex = result['index'] as int;
                    final lessonList = result['list'] as List<Lessons>;

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LessonView(
                                  lessonsList: lessonList,
                                  selectedLessonIndex: lessonIndex,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Lesson ${lesson.lessonNumber}: ${lesson.lessonTitle}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              category,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          height: 0,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
