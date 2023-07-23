import 'package:flutter/material.dart';
import 'BookSelection.dart';
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


class FavouriteBooks extends StatefulWidget {
  FavouriteBooks({super.key, required this.favouriteList});

  List<Book> favouriteList;

  @override
  State<FavouriteBooks> createState() => _FavouriteBooksState();
}


class _FavouriteBooksState extends State<FavouriteBooks> {
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
        title: Text('Favourite Books'),
      ),
      body: ListView.builder(
        itemCount: widget.favouriteList.length,
        itemBuilder: (context, index) {
          return MyListItem(
            itemText: widget.favouriteList[index].title,
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookSelection(selectedBook: widget.favouriteList[index], favouriteList: widget.favouriteList,)
                    ),
                );
              }
          );
        }
      )
    );
  }
}