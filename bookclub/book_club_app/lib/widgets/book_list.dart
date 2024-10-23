import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../cubit/book_cubit.dart';

class BookListPage extends StatelessWidget {
  final List<Book> books;

  const BookListPage({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              context.read<BookCubit>().showBookDetail(book);
            },
            child: Container(
              height: 150, 
              width: 100, 
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150, 
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        book.imageUrl,
                        fit: BoxFit.cover, 
                        width: double.infinity,
                        
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    book.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
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
