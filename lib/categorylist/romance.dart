import 'package:flutter/material.dart';
import 'package:book_dadyy/colors.dart';

class Book {
  final String title;
  final String author;
  final String imagePath;
  final String rating;
  final String stock;

  Book({required this.title, required this.author, required this.imagePath, required this.rating,required this.stock,});
}

class romance extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10  ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
    Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10  ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10  ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),
     Book(
      title: 'Book 1',
      author: 'Author 1',
      imagePath: 'assets/images/mom.jpg',
      rating:'5 / 10',
      stock:'10 ' // Replace with your actual image path
    ),


    // Add more books with their respective image paths
  ];




  void handleBookPressed(BuildContext context, Book book) {
    // Handle the onPressed event for the book card
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      
             title: Text('Romance') ,
            content: Text(' ${book.title} \n\n Author : ${book.author}\n\n Rating : ${book.rating} \n\n In Stock : ${book.stock} '),
                titleTextStyle: TextStyle(fontSize: 20,color:Color.fromARGB(255, 243, 93, 33),fontWeight: FontWeight.bold,),
                contentTextStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor:KSecondaryColor,
        title: Text('Romance'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => handleBookPressed(context, books[index]),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
               side: BorderSide(
        color: Color.fromARGB(255, 83, 62, 42),
        width: .0,
      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                        bottom: Radius.circular(8.0)
                      ),
                      child: Image.asset(
                        books[index].imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}