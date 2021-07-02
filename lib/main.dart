import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/data/movie.dart';
import 'package:movieapp/layout/movie_card.dart';
import 'package:movieapp/services/movie_services.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[700],
      ),
      home: MyHomePage(title: 'Movie App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getMovies(),
        builder: (context, snapshot) => Container(
          child: GridView.count(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2 / 3, //Default Aspect Ratio for movie posters
            children: _getItems(snapshot),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<Movie>> _getMovies() async {
    return await MovieServices.getMovies();
  }

  List<Widget> _getItems(snapshot) {
    if (snapshot.hasData) {
      List<Widget> cards = [];
      for (Movie movie in snapshot.data) {
        cards.add(MovieCard(movie));
      }
      return cards;
    } else
      return [Center(child: Text('No Movies.'))];
  }
}
