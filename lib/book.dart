

class Book{
  String title = "";
  String author = "";
  String genre = "";

  Book(String title, String author, String genre){
    this.title = title;
    this.author = author;
    this.genre = genre;
  }

  String getTitle() {
    return title;
  }

  String getAuthor() {
    return author;
  }

  String getGenre() {
    return genre;
  }
}