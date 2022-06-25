import 'bookstoreAbstract.dart';
import 'dart:io';

class BookStore extends BookStoreAbstract {
  static List<Map> books = [];

  BookStore();

  @override
  void addBook(
      {required id,
      required title,
      required author,
      required price,
      required quantity}) {
    bool bookInSystem = false;
    //A loop to check if ID already exists in the system
    for (var book in books) {
      if (book["ID"] == id) {
        print("This book with ID: $id exists in the system.");
        print("Please enter another ID");
        bookInSystem = true;
      }
    }
    if (bookInSystem == false) {
      books.add({
        "ID": id,
        "Title": title,
        "Author": author,
        "Price": price,
        "Quantity": quantity
      });
    }
  }

  @override
  //A method to delete a book from the list
  void deleteBook({required id}) {
    bool check = false;
    for (int book = 0; book < books.length; book++) {
      if (books[book]["ID"] == id) {
        books.removeAt(book);
        check = true;
      }
    }
    if (check == false) {
      print("Book not found");
    }
  }

  @override
  //A method to edit a book's information
  void editBook({required id}) {
    bool check = false;
    for (var book in books) {
      if (book["ID"] == id) {
        check = true;
      }
    }
    if (check) {
      print("Please choose from the menu what you want to edit");
      print("1. Title");
      print("2. Author");
      print("3. Price");
      print("4. Quantity");

      int input = int.parse(stdin.readLineSync()!);

      switch (input) {
        case 1:
          print("Enter the new title");
          String title = stdin.readLineSync()!;
          for (var book in books) {
            if (book["ID"] == id) {
              book["Title"] = title;
              print("The new book information is:");
              printBookInfo(book);
              break;
            }
          }
          break;
        case 2:
          print("Enter the new author");
          String author = stdin.readLineSync()!;
          for (var book in books) {
            if (book["ID"] == id) {
              book["Author"] = author;
              print("The new book information is:");
              printBookInfo(book);
              break;
            }
          }
          break;
        case 3:
          print("Enter the new price");
          int price = int.parse(stdin.readLineSync()!);
          for (var book in books) {
            if (book["ID"] == id) {
              book["Price"] = price;
              print("The new book information is:");
              printBookInfo(book);
              break;
            }
          }
          break;
        case 4:
          print("Enter the new quantity");
          int quantity = int.parse(stdin.readLineSync()!);
          for (var book in books) {
            if (book["ID"] == id) {
              book["Quantity"] = quantity;
              print("The new book information is:");
              printBookInfo(book);
              break;
            }
          }
          break;
      }
    } else {
      print("No book with ID: $id exists in our system");
    }
  }

  @override
  //A method to print all books in the system
  void PrintAllBooksInfo() {
    for (var book in books) {
      printBookInfo(book);
      print("------------------");
      print("------------------");
    }
  }

  @override
  //A method to search for a book by ID, title, or author
  void searchForBook() {
    print("Please choose from the menu:");
    print("1. ID");
    print("2. Title");
    print("3. Author");

    int input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        print("Please enter the book's ID");
        int id = int.parse(stdin.readLineSync()!);
        bool check = false;
        for (var book in books) {
          if (book["ID"] == id) {
            printBookInfo(book);
            check = true;
          }
        }
        if (check == false) {
          print("Sorry, this book doesn't exist");
        }
        break;
      case 2:
        print("Please enter the book's Title");
        String title = stdin.readLineSync()!;
        for (var book in books) {
          if (book["Title"] == title) {
            printBookInfo(book);
          } else {
            print("Sorry, this book doesn't exist");
          }
        }
        break;
      case 3:
        print("Please enter the book's Author");
        String author = stdin.readLineSync()!;
        for (var book in books) {
          if (book["Author"] == author) {
            printBookInfo(book);
          } else {
            print("Sorry, this book doesn't exist");
          }
        }
        break;
    }
  }

  //A method to print a single book's information
  void printBookInfo(var book) {
    print("Book's ID: ${book["ID"]}");
    print("Book's Title: ${book["Title"]}");
    print("Book's Author: ${book["Author"]}");
    print("Book's Price: ${book["Price"]}");
    print("Book's Quantity: ${book["Quantity"]}");
  }
}
