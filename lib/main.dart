import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Anime {
  final String title;
  final String imageUrl;
  final String description;

  Anime({required this.title, required this.imageUrl, required this.description});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Archives',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimeListScreen(),
    );
  }
}

class AnimeListScreen extends StatelessWidget {
  final List<Anime> animeList = [
    Anime(
      title: 'Attack on Titan',
      imageUrl: 'https://pbs.twimg.com/media/F-Fs4wqbQAAhI4r?format=jpg&name=large',
      description: 'A story about humanity fighting against giant humanoid creatures.',
    ),
    Anime(
      title: 'My Hero Academia',
      imageUrl: 'https://staticg.sportskeeda.com/editor/2023/01/4afd0-16751114556505-1920.jpg?w=840',
      description: 'Follows the journey of a young boy with no powers striving to be a hero.',
    ),
    Anime(
      title: 'One Piece',
      imageUrl: 'https://dw9to29mmj727.cloudfront.net/promo/2016/5265-SeriesHeaders_OP_2000x800_wm.jpg',
      description: 'Follows the journey of a young boy with no powers striving to be a hero.',
    ),
    Anime(
      title: 'Demon Slayer',
      imageUrl: 'https://dashgamer.com/wp-content/uploads/2021/10/dslayerhero.jpg',
      description: 'Follows the journey of a young boy with no powers striving to be a hero.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Archives'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Set the number of tiles in each row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailScreen(anime: animeList[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Image.network(
                      animeList[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    animeList[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimeDetailScreen extends StatelessWidget {
  final Anime anime;

  AnimeDetailScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(anime.imageUrl),
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                anime.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
