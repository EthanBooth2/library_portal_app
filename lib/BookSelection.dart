import 'package:flutter/material.dart';
import 'book.dart';

class BookSelection extends StatelessWidget {
  const BookSelection({super.key, required this.selectedBook});
  final Book selectedBook;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(selectedBook.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Author: ${selectedBook.author}", style: const TextStyle(fontSize: 18.0),),
            Text("Genre: ${selectedBook.genre}", style: const TextStyle(fontSize: 18.0),),
            Text("Description: ${selectedBook.description}", style: const TextStyle(fontSize: 18.0),),
            Tooltip(
              message: "Download",
              child: ButtonTheme(
                minWidth: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("download");
                    },
                  child: const Icon(Icons.download),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {
                    print("favourite");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}