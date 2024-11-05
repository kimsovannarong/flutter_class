import 'package:flutter/material.dart';
//version 1
List<String> images = [
  "assets/images/W4-S3/bird.jpg",
  "assets/images/W4-S3/bird2.jpg",
  "assets/images/W4-S3/girl.jpg",
  "assets/images/W4-S3/insect.jpg",
  "assets/images/W4-S3/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      // this line is used to remove the Debug banner
      // which appears in the top rihgt of our screen .
      // in this case, we remove that banner so that
      // we can access the 2 Iconbuttons in appbar without any
      // interuptions and the UI is clearer
      home:Imagemove(),
    )
);
class Imagemove extends StatefulWidget {
  const Imagemove({super.key});

  @override
  State<Imagemove> createState() => _ImagemoveState();
}

class _ImagemoveState extends State<Imagemove> {
  int imageIndex=0;
  void NextImage(){
    setState(() {
      imageIndex = (imageIndex + 1 ) % images.length;
    });
  }
  void BackImage(){
    setState(() {
      imageIndex = (imageIndex - 1 ) % images.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: BackImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: NextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }
}
