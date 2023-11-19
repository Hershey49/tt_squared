import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tic Tac Toe Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

// Builds the Big Board
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0, 
          crossAxisSpacing: 4.0, 
        ),


        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0), 
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black), 
            ),


            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),


    
              itemBuilder: (context, i) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), 
                  ),


                  child: Center(
                    child: Container(), //Placeholder when we work on functionality for the game
                  ),



                );
              },
            ),
          );
        },
      ),
    );
  }
}

/*
Harsha Palacherla 11/18/23
Comments for future:
-We will need to see how Dart uses clicked states
-We will need to work on the algorythm for the game
-
-
-
*/

/* shreya is making a c
omment*/