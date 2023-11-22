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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
           body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Start Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage(title: 'Game Page')),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Info Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage(title: 'Info Page')),
                );
              },
            ),
             SizedBox(height: 20),
              ElevatedButton(
              child: Text('Stats Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatPage(title: 'Stats Page')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatefulWidget {
  final String title;

  const InfoPage({Key? key, required this.title}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('This will be Info Page in the future'),
      ),
    );
  }
}

class StatPage extends StatefulWidget {
  final String title;

  const StatPage({Key? key, required this.title}) : super(key: key);

  @override
  _StatPageState createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('This will be the Stats Page in the future'),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

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
    if (displayPiece[index][i] == '') {
      displayPiece[index][i] = playerOne ? "O" : "X";
      playerOne = !playerOne;
    }
  });
}
}