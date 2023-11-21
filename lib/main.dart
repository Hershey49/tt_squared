import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Squared',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Tic Tac Squared'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Start Game'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyGamePage(title: 'Tic Tac Toe Game Page')),
            );
          },
        ),
      ),
    );
  }
}

class MyGamePage extends StatefulWidget {
  const MyGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyGamePageState createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {

bool playerOne = true;
List<List<String>> displayPiece = List.generate(9, (_) => List.filled(9, ""));

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
            child: Container(
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
                  return GestureDetector(
                    onTap:() => _tapped(index, i),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), 
                      ),
                            
                            
                      child: Center(
                        child: Text(displayPiece[index][i]), 
                      ),
                            
                            
                            
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapped (int index, int i) {
  setState((){
    displayPiece[index][i] = playerOne ? "O" : "X";
    playerOne = !playerOne;
  });
}
}


/*
Harsha Palacherla 
11/18/23
-We will need to see how Dart uses clicked states
-We will need to work on the algorythm for the game

11/20/23
-Worked on clicking functionality of each indvidual box. Ran into errors where clicks would apply to entire table/screen etc.
-(cont.) Fixed it by indexing the overall table and position in table in a List
- Used Gesture Detector to work on clicks
- For now only changes on Tap to X. Researching if terniary statements in Dart are possible, because that will be very useful
-(cont.) for changing player turns/states in case of mistakes. 
- Reset Function that sets the state of all instances to 0? 
*/

/* Shreya Dubey
11/19/23
-Testing Github and Repo
*/

/*Jessica Harris
*/