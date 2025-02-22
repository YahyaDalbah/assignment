class Book {
  String title;
  String? author;
  int? year;
  String? genre;
  Book(this.title, this.author, this.year, this.genre);
  String getAllInfo() =>
      "title: $title, author: $author, year: $year, genre: $genre";
  String getInfoWithoutTitle() => "author: $author, year: $year, genre: $genre";
}

void main() {
  Map<String, Book> library = {};

  addBook(library, title: "book1", genre: "action");

  listAllBooks(library);

  listBooksByGenre(library, genre: "ac");

  print(getBookInfo(library, title: "book1"));

  print(removeBook(library, title: "book1"));

  listAllBooks(library);
}

void addBook(
  Map<String, Book> library, {
  required String title,
  String author = "default author",
  int year = 2000,
  String genre = "default genre",
}) {
  library[title] = Book(title, author, year, genre);
}

String getBookInfo(Map<String, Book> library, {required String title}) {
  Book? book = library[title];
  if (book == null) {
    return "Book not found";
  }
  return book.getInfoWithoutTitle();
}

void listAllBooks(Map<String, Book> library, [String genre = ""]) {
  if (library.values.isEmpty) {
    print("no books in library");
    return;
  }
  List<Book> books =
      library.values.where((book) => book.genre == genre).toList();
  if (books.isEmpty) {
    library.values.forEach((book) => print(book.getAllInfo()));
  } else {
    books.forEach((book) => print(book.getAllInfo()));
  }
}

//print a string if no books found, then return books (empty list if no books found)
List<Book> listBooksByGenre(Map<String, Book> library, {String genre = ""}) {
  List<Book> books =
      library.values.where((book) => book.genre == genre).toList();
  if (books.isEmpty) {
    print("No books found for this genre.");
  }
  return books;
}

String removeBook(Map<String, Book> library, {required String title}) {
  Book? removedBook = library.remove(title);
  if (removedBook == null) {
    return "Book not found.";
  } else {
    return "Book removed successfully";
  }
}
