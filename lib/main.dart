import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text('Book List',
        style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CardWidget('The Great Gatsby', ' F. Scott Fitzgerald', '4.5','images (1).jpg',
              'It tells the tragic story of Jay Gatsby, a self-made millionaire, and his pursuit of Daisy Buchanan, a wealthy young woman whom he loved in his youth',13.5),
          CardWidget('Don Quixote', 'Miguel de Cervantes', '3.8',
              'images.jpg','Don Quixote is a classic novel from 1605 which portraits the life and insightful journey of Don Quixote de la Mancha',15.6),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String imageName;
  final String description;
  final double price;

  CardWidget(this.bookName, this.authorName, this.bookRating,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[50],
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/images/$imageName'), // Replace with actual URL
            title: Text(bookName,
                style: TextStyle(fontSize: 25)),
            subtitle: Text(authorName),
          ),
          ListTile(
            title: Text('Rating: $bookRating',
                style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage(bookName,authorName,imageName,description,price)),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Buy Now'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String imageName;
  final String description;
  final double price;

  SecondPage(this.bookName,this.authorName,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Buy Now'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName\n',
            style: TextStyle(fontSize: 24),),
            Image.asset('assets/images/$imageName'), // Replace with actual URL
            Text('\nAuthor Name: $authorName'), // Replace with actual author name
            Text('\nShort Description: $description'),
            Text('\nPrice: \$$price',
              style: TextStyle(fontSize: 18),), // Replace with actual price
            DropdownButton<String>(
              items: ['Real copy', 'Paper print', 'Black & white'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection
              },
              hint: Text('Select an option'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
