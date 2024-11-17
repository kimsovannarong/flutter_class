class Joke {
  final String title;
  final String description;

  Joke({
    required this.title,
    required this.description,
  });
  // list of 20 jokes
  List<Joke> getJokes() {
    List<Joke> jokes = [];
    for (var i = 0; i < 20; i++) {
      jokes.add(
        Joke(title: "Title", description: "description"),
      );
    }
    return jokes;
  }
}