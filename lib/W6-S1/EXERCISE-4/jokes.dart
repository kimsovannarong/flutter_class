
class Joke {
  final String? title;
  final String? description;

  Joke({required this.title, required this.description});
}

// list of 20 jokes
final List<Joke> jokes = List.generate(
  20,
      (index) => Joke(
    title: "Title",
    description: "Description",
  ),
);
