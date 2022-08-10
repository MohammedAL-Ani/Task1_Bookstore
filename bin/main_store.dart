import 'dart:io';

void main() {
  displayMainMenu('Display all books', 'Display books with rate +4.',
      'Add book', 'Update book', 'Delete book', 'Search');
  print("Write your choice:");
  int? chooseNumber = int.parse(stdin.readLineSync()!);
  print(chooseNumber);
}

void displayMainMenu(var allBooks, var rateBigthan4, var addBook,
    var updateBook, var deleteBook, var serach) {
  print('''
  Main menu
  1- $addBook
  2- $rateBigthan4
  3- $addBook
  4- $updateBook
  5- $deleteBook
  6- $serach
  ''');
}
