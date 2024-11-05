import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Bestcard(),
      ),
    ));
class Bestcard extends StatelessWidget {
  const Bestcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Mycard(),
        Mycard(),
        Mycard(),
      ],
    );
  }
}

class Mycard extends StatefulWidget {
  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  late bool isFavorite=true;
  void switchFavorite(){
    setState(() {
      isFavorite=!isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",style: TextStyle(
                      color: Colors.blueAccent
                    ),),
                    Text("description")
                  ],
                ),
              ),
              IconButton(
                  onPressed: switchFavorite,
                  icon: Icon(Icons.favorite,color:isFavorite?Colors.grey:Colors.red,)
              )
            ],
          ),
        )
      ],
    );
  }
}
