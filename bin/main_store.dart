import 'dart:io';

void main() {
  Book boo1 = Book(bookName: 'AI', authorName: 'Mohammed Maher', rate: 4.3);
  Book boo2 = Book(bookName: 'Dart', authorName: 'Karrar', rate: 3.8);
  Book boo3 =
      Book(bookName: "java dart", authorName: "Mohammed ALi ", rate: 3.9);
  Book newone = Book(bookName: "df", authorName: "dd", rate: 4.4);
  List<Book> storeBook = [boo1, boo2, boo3, newone];

  BookController bookContoller = BookController();
  //
  bookContoller.books = storeBook;

  print('''
  Main menu
  1- DispalyAllBook
  2- ratethanFour
  3- addBook
  4- updateBook
  5- deleteBook
  6- serach
  
  ''');
  print("Write your choice:");
  int? chooseNumber = int.parse(stdin.readLineSync()!);
  if (chooseNumber >= 6) {
    print("This option doesn't include the main menu !");
  } else {
    print(chooseNumber);
  }

  switch (chooseNumber) {
    case 1:
      bookContoller.displayAllBook();
      break;
    case 2:
      bookContoller.rateThanFour();
      break;
    case 3:
      bookContoller.addBook();
      break;
    case 4:
      bookContoller.deleteBook();
      break;
    case 5:
      bookContoller.updateBook();
      break;
    case 6:
      bookContoller.searchBook();
      break;
  }
}

class Book {
  String bookName;
  String authorName;
  double rate;

  Book({required this.bookName, required this.authorName, required this.rate});
}

class BookController {
  List books = <Book>[];

  void displayAllBook() {
    List<Book>? listBook = books.cast<Book>();
    if (listBook.isEmpty) {
      print("There is no Books!");
    } else {
      print("Name\t\t\t\tAuthor\t\t\t\tRate");
      listBook.forEach((book) {
        print(
            "${book.bookName}\t\t\t\t${book.authorName}\t\t\t\t${book.rate}}");
      });
    }
  }

  void rateThanFour() {
    List<Book>? listBook = books.cast<Book>();
    if (listBook.isEmpty) {
      print("There is no Books!");
    } else {
      print("Name\t\t\t\tAuthor\t\t\t\tRate");
      listBook.forEach((book) {
        if (book.rate >= 4.0) {
          print(
              "${book.bookName}\t\t\t\t${book.authorName}\t\t\t\t${book.rate}}");
        }
      });
    }
  }

  void addBook() {
    List<Book>? listBook = books.cast<Book>();
    print('Enter the number to add:');
    int? inputTextNum = int.parse(stdin.readLineSync()!);

    if (listBook.isEmpty) {
      print("There is no Books!");
    } else {
      int x = 1;
      listBook.forEach((book) {
        while (x <= inputTextNum) {
          {
            print('Enter book $x book Name: ');
            String? inputTextBookName = stdin.readLineSync();
            book.bookName = inputTextBookName!;

            print('Enter book $x author Name:');
            String? inputTextAuthorName = stdin.readLineSync();
            book.authorName = inputTextAuthorName!;

            print('Enter book $x rate:');
            double? inputTextRate = double.parse(stdin.readLineSync()!);
            book.rate = inputTextRate;
          }

          x++;
        }
      });

      listBook.forEach((book) {
        print(
            "${book.bookName}\t\t\t\t${book.authorName}\t\t\t\t${book.rate}}");
      });
    }
  }

  void deleteBook() {
    List<Book>? listBook = books.cast<Book>();

    print('Enter the book name:');
    String? inputText = stdin.readLineSync();

    listBook.removeWhere((element) => element.bookName == inputText);
    print('book has been deleted');
  }

  void updateBook() {
    List<Book>? listBook = books.cast<Book>();
    print('Enter the book name:');
    String? inputText = stdin.readLineSync();

    if (listBook.isEmpty) {
      print("There is no Books!");
    } else {
      listBook.asMap().forEach((index, book) {
        if (book.bookName == inputText!) {
          print('Enter book $index book Name: ');
          String? inputTextBookName = stdin.readLineSync();
          book.bookName = inputTextBookName!;
          print('Enter book $index author Name:');
          String? inputTextAuthorName = stdin.readLineSync();
          book.authorName = inputTextAuthorName!;
          print('Enter book $index rate:');
          double? inputTextRate = double.parse(stdin.readLineSync()!);
          book.rate = inputTextRate;

          print(
              "${book.bookName}\t\t\t\t${book.authorName}\t\t\t\t${book.rate}}");
        }
      });
    }
  }

  void searchBook() {
    List<Book>? listBook = books.cast<Book>();
    print('Enter a query:');
    String? inputText = stdin.readLineSync();

    if (listBook.isEmpty) {
      print("There is no Books!");
    } else {
      print("Name\t\t\t\tAuthor\t\t\t\tRate");
      listBook.forEach((book) {
        if (book.bookName.contains(inputText!)) {
          print(
              "${book.bookName}\t\t\t\t${book.authorName}\t\t\t\t${book.rate}}");
        } else {
          print("This entry is not available in books");
        }
      });
    }
  }
}
