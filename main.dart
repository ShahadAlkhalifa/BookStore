import 'dart:io';
import 'bookstore.dart';

void main() {
  int input, id, price, quantity;
  String title, author;
  BookStore bookStore = BookStore();

  bookStore.addBook(
      id: 1,
      title: "Start with why",
      author: "Simon Sinek",
      price: 80.0,
      quantity: 13);
  bookStore.addBook(
      id: 2,
      title: "But how do it know",
      author: "J. Clark Scott",
      price: 59.9,
      quantity: 22);
  bookStore.addBook(
      id: 3,
      title: "Clean Code",
      author: "Robert Cecil Martin",
      price: 50.0,
      quantity: 5);
  bookStore.addBook(
      id: 4,
      title: "Zero to One",
      author: "Peter Thiel",
      price: 45.0,
      quantity: 12);
  bookStore.addBook(
      id: 5,
      title: "You don't know JS",
      author: "Kyle Simpson",
      price: 39.9,
      quantity: 9);

  do {
    print("----- Welcome to our book store! -----");
    print("----- Please choose from the menu -----");
    print("----- 1. Add Book -----");
    print("----- 2. Edit a Book -----");
    print("----- 3. Delete a Book -----");
    print("----- 4. Show Book Information -----");
    print("----- 5. Search for Book By: -----");
    print("----- 6. exit -----");

    input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        print("Adding a new book");
        print("Please enter the book ID");
        id = int.parse(stdin.readLineSync()!);
        print("Please enter the book title");
        title = stdin.readLineSync()!;
        print("Please enter the author");
        author = stdin.readLineSync()!;
        print("Please enter the price");
        price = int.parse(stdin.readLineSync()!);
        print("Please enter the quantity");
        quantity = int.parse(stdin.readLineSync()!);
        bookStore.addBook(
            id: id,
            title: title,
            author: author,
            price: price,
            quantity: quantity);
        break;
      case 2:
        print("Enter the book's ID to edit:");
        id = int.parse(stdin.readLineSync()!);
        bookStore.editBook(id: id);
        break;
      case 3:
        print("Enter the book's ID to delete:");
        id = int.parse(stdin.readLineSync()!);
        bookStore.deleteBook(id: id);
        break;
      case 4:
        bookStore.PrintAllBooksInfo();
        break;
      case 5:
        bookStore.searchForBook();
        break;
      case 6:
        print("Thank you for using our book store, Take care!");
        exit(6);
    }
  } while (input != 6);
}
