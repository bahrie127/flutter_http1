import 'package:flutter/material.dart';

import 'album.dart';
import 'network_manager.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = NetworkManager().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter REST API',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('http example GET')),
            body: FutureBuilder<Album>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                      child: Column(
                    children: [
                      Text(snapshot.data!.title),
                    ],
                  ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
              future: futureAlbum,
            ),
          ),
        );

    
  }
}
