// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:audioplayers/audioplayers.dart';
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
         actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.audiotrack,
        color: Colors.white,
        size: 30.0
      ),
      onPressed: () {
        // play music
        final player = AudioPlayer();
        player.play(AssetSource('music.mp3'));
      },
    )
  ],
      ),
           body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Multiplayer Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MPGamePage(title: 'Game Page')),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text("The game is played as follows:\nA large gameboard containing 81 squares divided into 9 small gameboards is provided. The first player to make a move may select a square anywhere across the 81 total squares. The location of this placement then determines which small gameboard the opponent may make their move in.",  
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,  
                    color: Color.fromARGB(255, 208, 219, 231),  
                    fontWeight: FontWeight.w500,  
                    letterSpacing: 1,  
                    wordSpacing: 1,  
                    shadows: [  
                      Shadow(color: Colors.black, offset: Offset(2,1), blurRadius:10)  
                    ]  
                  ),
              ),
              Image.asset('images/gameboardOneX.png'),   // resize this image 
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(  
              "Hello World! This is a Text Widget.",  
              style: TextStyle(  
                fontSize: 12,  
                color: Color.fromARGB(255, 192, 210, 231),  
                fontWeight: FontWeight.w500,  
                letterSpacing: 8,  
                wordSpacing: 1,  
                shadows: [  
                  Shadow(color: Colors.black, offset: Offset(2,1), blurRadius:10)  
                ]  
              ),
          ),
        ),
        ]
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

class MPGamePage extends StatefulWidget {
  const MPGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MPGamePageState createState() => _MPGamePageState();
}

class _MPGamePageState extends State<MPGamePage> {

bool playerState = true;
String playerOne = 'X';
String playerTwo = 'O';
List<List<String>> displayPiece = List.generate(9, (_) => List.filled(9, ""));
List<String> bigBoard = List.filled(9, "");
int nextMove = -1;

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

void _tapped(int index, int i) {
  setState(() {
    if (nextMove == -1 || checkWin(displayPiece[nextMove], playerOne) || checkWin(displayPiece[nextMove], playerTwo)) {
      nextMove = -1; // Reset nextMove so the player can play anywhere
    }

    if(nextMove == -1 || index == nextMove){
     if (displayPiece[index][i] == '') {
      displayPiece[index][i] = playerState ? playerOne : playerTwo;
      playerState = !playerState;
      nextMove = i;

      // Calls the checkWin Function for small board
      if (checkWin(displayPiece[index], displayPiece[index][i])) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${displayPiece[index][i]} wins on small board $index!'),
            duration: Duration(seconds: 3),  
          ),
        );

        // This sets the whole small board to the winning player
        for (int j = 0; j < displayPiece[index].length; j++) {
          displayPiece[index][j] = displayPiece[index][i];
        }

        // This changes the value for corresponding Big Board value
        bigBoard[index] = displayPiece[index][i];

        if (checkWin(bigBoard, bigBoard[index])) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Game Over'),
                content: Text('${bigBoard[index]} wins! Would you like to play again?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      resetBoard();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
    }
  });
}

// This function resets both the Small Boards and Big Board
void resetBoard() { 
  setState(() {
    for (int i = 0; i < displayPiece.length; i++) {
      for (int j = 0; j < displayPiece[i].length; j++) {
        displayPiece[i][j] = '';
      }
    }
    for (int i = 0; i < bigBoard.length; i++) {
      bigBoard[i] = '';
    }
  });
}

bool checkWin(List<String> board, String player) {
  // Check rows
  for (int i = 0; i < 9; i += 3) {
    if (board[i] == player && board[i + 1] == player && board[i + 2] == player) {
      nextMove = -1;
      return true;
    }
  }
  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
      nextMove = -1;
      return true;
    }
  }
  // Check diagonals
  if ((board[0] == player && board[4] == player && board[8] == player) ||
      (board[2] == player && board[4] == player && board[6] == player)) {
    nextMove = -1;
    return true;
  }
  return false;
}
}