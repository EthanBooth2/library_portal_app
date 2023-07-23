import 'package:flutter/material.dart';
import 'book.dart';
import 'BookSelection.dart';

class CatalogueSearch extends StatefulWidget{
  CatalogueSearch({super.key, required this.bookList});

  List<Book> bookList;

  @override
  _CatalogueSearchState createState() => _CatalogueSearchState();
}

class _CatalogueSearchState extends State<CatalogueSearch>{
  final _authorController = TextEditingController();
  final _titleController = TextEditingController();
  String warningText = "";

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
        title: const Text('Search books'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          for(int i = 0; i < widget.bookList.length; i++){
                            if(widget.bookList[i].author == _authorController.text){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookSelection(selectedBook: widget.bookList[i],)
                                ),
                              );
                            }else{
                              setState(() {
                                warningText = "no books by that author could be found";
                              });
                            }
                          }
                        },
                        child: const Icon(Icons.search),
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
                          for(int i = 0; i < widget.bookList.length; i++){
                            if(widget.bookList[i].title == _titleController.text){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookSelection(selectedBook: widget.bookList[i],)
                                ),
                              );
                            }else{
                              setState(() {
                                warningText = "No book with that tile could be found";
                              });
                            }
                          }
                        },
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(warningText, style: const TextStyle(color: Colors.red),),
          ],
        ),
      ),
    );
  } 
}

