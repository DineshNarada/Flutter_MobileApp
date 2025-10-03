import 'package:flutter/material.dart';
import 'article_detail_screen.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  static const List<Map<String, String>> articles = [
    {
      'title': 'Dog Nutrition Basics',
      'content': 'Learn about essential nutrients for your dog\'s health.',
      'fullContent': 'detailed',
    },
    {
      'title': 'Choosing the Right Dog Food',
      'content': 'Tips on selecting the best food for your dog\'s breed and age.',
      'fullContent': 'detailed',
    },
    {
      'title': 'Common Dog Health Issues',
      'content': 'Information on dietary needs for common health problems.',
      'fullContent': 'detailed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(
                    title: article['title']!,
                    content: article['fullContent']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.brown[400],
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article['content']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Tap to read more',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.brown[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
