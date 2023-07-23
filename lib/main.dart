import 'package:flutter/material.dart';
import 'bookCatalogue.dart';
import 'FavouriteBooks.dart';
import 'book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Portal',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Library portal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Book> favouriteList = [];

  void loadList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookCatalogue(favouriteList: favouriteList,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tooltip(
              message: "Catalogue",
              child: ButtonTheme(
                minWidth: 200, // Set the desired width
                height: 50, // Set the desired height
                child: ElevatedButton(
                  onPressed: loadList,
                  child: const Text('Book Catalogue'),
                ),
              ),
            ),
            Tooltip(
              message: "Favourites",
              child: ButtonTheme(
                minWidth: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavouriteBooks(favouriteList: favouriteList,)),
                    );
                  },
                  child: const Text('Favourites'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
