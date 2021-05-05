import 'package:flutter/material.dart';
import 'package:flutter_story_list/flutter_story_list.dart';

void main() => runApp(MyApp());

const _kImageUrls = [
  "https://images.unsplash.com/photo-1578496480157-697fc14d2e55?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1583912086296-be5b665036d3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1576086213369-97a306d36557?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1601961545517-59307b1fbac3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1579684256060-d5a308109e21?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1583912267550-d974311a9a6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1578496479939-722d9dd1cc5b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1582719201952-ea63ac1671dc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1583911860205-72f8ac8ddcbe?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1578496781329-41da6c97ffc4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHNhbXBsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Story List'),
        ),
        body: Column(
          children: [
            StoryList(
              onPressedIcon: () {
                //TODO something
              },
              image: Image.network(
                _kImageUrls.first,
                fit: BoxFit.cover,
              ),
              text: Text(
                "Create Story",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              itemCount: _kImageUrls.length,
              itemBuilder: (context, index) => Image.network(
                _kImageUrls[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
