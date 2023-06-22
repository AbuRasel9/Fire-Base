import 'package:cloud_firestore/cloud_firestore.dart';

import 'Book.dart';

class CloudStoreHelper {
  //create instance
  final db = FirebaseFirestore.instance;

  Future<List<Book>> getAllBooks() async {
    //create listOfBooks for set all books
    List<Book> ListOfBooks = [];
    final result = await db.collection('Books').get();
      for (var element in result.docs) {
        Book book = Book(
            //get all information in firebase collection
            element.get('name'),
            element.get("type"),
            element.get('date').toString(),
            //parse forcely double to string
            double.tryParse(element.get('price').toString())?? 0

        );

        ListOfBooks.add(book);
      }

      return ListOfBooks;

  }
}
