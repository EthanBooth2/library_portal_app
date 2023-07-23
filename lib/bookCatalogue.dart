import 'package:flutter/material.dart';
import 'book.dart';

class MyListItem extends StatelessWidget {
  final String itemText;
  final VoidCallback onTap;

  MyListItem({required this.itemText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          itemText,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  } 
}

class BookCatalogue extends StatefulWidget {
  BookCatalogue({super.key});

  @override
  State<BookCatalogue> createState() => _BookCatalogueState();
}

class _BookCatalogueState extends State<BookCatalogue> {

  @override
  void initState() {
    super.initState();
    addElements();
  }

  Book testBook = Book("helloWorld", "Student", "non-fiction", "this is an example of the description of a book");
  List<Book> bookList = [];
  void addElements() {
    bookList.add(testBook);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('BookCatalogue'),
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return MyListItem(
            itemText: bookList[index].title,
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookSelection(selectedBook: bookList[index],)
                    ),
                );
              }
          );
        }
      )
    );
  }
}

class BookSelection extends StatelessWidget {
  const BookSelection({super.key, required this.selectedBook});
  final Book selectedBook;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            )
          ],
        ),
      ),
    );
  }
}