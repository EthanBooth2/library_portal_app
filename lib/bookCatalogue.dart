import 'package:flutter/material.dart';
import 'book.dart';
import 'catalogueSearch.dart';
import 'BookSelection.dart';

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
  BookCatalogue({super.key, required this.favouriteList});

  List<Book> favouriteList;

  @override
  State<BookCatalogue> createState() => _BookCatalogueState();
}

class _BookCatalogueState extends State<BookCatalogue> {

  @override
  void initState() {
    super.initState();
    addElements();
  }

  Book testBook = Book("HelloWorld", "Student", "non-fiction", "this is an example of the description of a book");
  Book testBookTwo = Book("TestBook", "Teacher", "fiction", "This is another example of the description of a book");
  Book testBookThree = Book("Third Book", "Other", "fiction", "This is the final example of the description of a book");
  List<Book> bookList = [];
  void addElements() {
    bookList.add(testBook);
    bookList.add(testBookTwo);
    bookList.add(testBookThree);
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

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogueSearch(bookList: bookList, favouriteList: widget.favouriteList,)
                )
              );
            }, 
            icon: Icon(Icons.search))
        ],
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
                    builder: (context) => BookSelection(selectedBook: bookList[index], favouriteList: widget.favouriteList,)
                    ),
                );
              }
          );
        }
      )
    );
  }
}

