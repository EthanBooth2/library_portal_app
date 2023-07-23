import 'package:flutter/material.dart';
import 'bookCatalogue.dart';
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
  final _authorController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _authorController.dispose();
    _titleController.dispose();
    super.dispose();
  }


  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void loadList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookCatalogue()),
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
                  child: Text('Book Catalogue'),
                ),
              ),
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: TextField(
                    controller: _authorController,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      hintText: 'Enter author name'
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Tooltip(
                    message: "Search",
                    child: ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print(_authorController.text);
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: TextField(
                    controller: _titleController,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      hintText: 'Enter book title'
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Tooltip(
                    message: "Search",
                    child: ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print(_titleController.text);
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
