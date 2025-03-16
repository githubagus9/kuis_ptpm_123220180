import 'package:flutter/material.dart';
import 'package:kuis_ptpm/detail_page.dart';
import 'package:kuis_ptpm/profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hot News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyNews.length,
        itemBuilder: (context, index) {
          final news = dummyNews[index];
          return _buildNewsCard(context, news);
        },
      ),
    );
  }
}

Widget _buildNewsCard(BuildContext context, NewsModel news) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: ListTile(
      leading: Image.network(
        news.image,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      title: Text(
        news.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.thumb_up, size: 16),
          const SizedBox(width: 5),
          Text('${news.likes} likes'),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailPage(news: news)),
        );
      },
    ),
  );
}

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;

  const NewsDetailPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.image),
            const SizedBox(height: 20),
            Text(
              news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(news.description),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 20),
                const SizedBox(width: 5),
                Text('${news.likes} likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
