abstract class BookStoreAbstract {
  late int ID;
  late String title;
  late String author;
  late double price;
  late int quantity;

  void addBook(
      {required id,
      required title,
      required author,
      required price,
      required quantity});

  void editBook({required id});

  void deleteBook({required id});

  void PrintAllBooksInfo();

  void searchForBook();
}
