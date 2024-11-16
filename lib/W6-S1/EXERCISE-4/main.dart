import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: appColor,
      title: const Text("Favorite Jokes"),
    ),
    body: const FavoriteJokesList(), // Use a StatefulWidget to manage favorites
  ),
));

class FavoriteJokesList extends StatefulWidget {
  const FavoriteJokesList({super.key});

  @override
  State<FavoriteJokesList> createState() => _FavoriteJokesListState();
}

class _FavoriteJokesListState extends State<FavoriteJokesList> {
  int _favoriteIndex = -1; // means no jokes sleected

  void setFavorite(int index) {
    setState(() {
      _favoriteIndex = (_favoriteIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 20; i++)
          FavoriteCard(
            title: "Title ",
            description: "Descriptions",
            isFavorite: _favoriteIndex == i,
            onFavoriteClick: () => setFavorite(i), // Update favorite selected
          ),
      ],
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
