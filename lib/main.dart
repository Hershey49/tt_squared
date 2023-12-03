// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, non_constant_identifier_names, override_on_non_overriding_member, unused_local_variable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math'; 
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GameStats(),
      child: MyApp(),
    ),
  );
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

class GameStats extends ChangeNotifier {
  int _gamesPlayed = 58;
  int _gamesWon = 0;
  int _leastMoves = 999;
  int _mostMoves = 0;


  int get gamesPlayed => _gamesPlayed;
  int get gamesWon=> _gamesWon;
  int get leastMoves=> _leastMoves;
  int get mostMoves=> _mostMoves;

  void incrementGamesPlayed() {
    _gamesPlayed++;
    notifyListeners();
  }

  void incrementGamesWon() {
    _gamesWon++;
    notifyListeners();
  }

  void updateLeastMoves(int moves) {
    if (moves < _leastMoves) {
      _leastMoves = moves;
      notifyListeners();
    }
  }

  void updateMostMoves(int moves) {
    if (moves > _mostMoves) {
      _mostMoves = moves;
      notifyListeners();
    }
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
   final Player = AudioPlayer(); 
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        actions: [
     PopupMenuButton(
     itemBuilder: (BuildContext context) => <PopupMenuEntry>[
    PopupMenuItem(
      value: "Sound On",
      onTap: () {
        Player.play(AssetSource('music.mp3'));
        Player.onPlayerComplete.listen((event) {
          Player.play(AssetSource('music.mp3'));
        });
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.volume_up_rounded, color: Colors.blue,)
          ),
          const Text(
            'Sound On',
            style: TextStyle(fontSize: 15), 
          ),
        ],
      ),
    ),
    PopupMenuItem(
      value: "Sound Off",
      onTap: () {
        Player.stop();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.volume_off_rounded, color: Colors.blue,)
          ),
          const Text(
            'Sound Off',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ),
  
  ],
)
]
      ),
           body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Single Player Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SPGamePage(title: 'Single Player Game Page')),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Multiplayer Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage(title: 'Multiplayer Game Page')),
                );
                Player.play(AssetSource('music.mp3'));
                Player.onPlayerComplete.listen((event) {
                Player.play(AssetSource('music.mp3'));
                 });
              }
              ,
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
                  MaterialPageRoute(
                    builder: (context) => StatPage(title: 'Stats Page'),
                  ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("\nTic Tac Squared is played as follows:\nA large gameboard containing 81 squares divided into 9 small gameboards is provided. The first player to make a move may select a square anywhere across the 81 total squares. The location of this placement then determines which small gameboard the opponent may make their move in.",  
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),), child: Image.asset('images/gameboardOneX.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),), child: Image.asset('images/gameboardOneXOneO.png')),
                      )
                    ],
                  ),
                  Text("Players continue placing their moves with the goal of winning a Tic-Tac-Toe on a small board. Once a player wins on a small board, all the spaces within that board will be filled with their designated icon. To win the large gameboard, a player must win three small gameboards to create a Tic-Tac-Toe in the large gameboard.\n",  
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
                ],
              ),
                    ),
            ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Included is an image containing an example win via the player representing X. A helpful tip to lead a player to success is:\n\n**Always keep track of the board your opponent will play in based off of your move!**\n\nBeing a strategy game comparable to chess, understanding an opponents moves is key to winning the game.",  
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
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),), child: Image.asset('images/exampleWin.png')),
                  ),
                ],
              ),
                    ),
            ),
          ]
        ),
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
    int gamesPlayed = Provider.of<GameStats>(context).gamesPlayed;
    int gamesWon= Provider.of<GameStats>(context).gamesWon;
    int leastMoves= Provider.of<GameStats>(context).leastMoves;
    int mostMoves= Provider.of<GameStats>(context).mostMoves;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Games Played: $gamesPlayed'),
          Text('Games Won: $gamesWon'),
          Text('Least Moves: $leastMoves'),
          Text('Most Moves: $mostMoves'),
          // Add other widgets or UI components as needed
        ],
      ),
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

bool playerState = true;
String playerOne = 'X';
String playerTwo = 'O';
List<List<String>> displayPiece = List.generate(9, (_) => List.filled(9, ""));
List<String> bigBoard = List.filled(9, "");
int nextMove = -1;
final Player = AudioPlayer(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
     PopupMenuButton(
     itemBuilder: (BuildContext context) => <PopupMenuEntry>[
    PopupMenuItem(
      value: "Sound On",
      onTap: () {
        Player.play(AssetSource('music.mp3'));
        Player.onPlayerComplete.listen((event) {
          Player.play(AssetSource('music.mp3'));
        });
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.volume_up_rounded, color: Colors.blue,)
          ),
          const Text(
            'Sound On',
            style: TextStyle(fontSize: 15), 
          ),
        ],
      ),
    ),
    PopupMenuItem(
      value: "Sound Off",
      onTap: () {
        Player.stop();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.volume_off_rounded, color: Colors.blue,)
          ),
          const Text(
            'Sound Off',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ),
  
  ],
)
]
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
          _updateGamesPlayed();
          _updateGamesWon();
          int movesInCurrentGame = calculateTotalMoves(displayPiece);
            _updateLeastMoves(movesInCurrentGame);
            _updateMostMoves(movesInCurrentGame);
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

int calculateTotalMoves(List<List<String>> gameBoard) {
  int totalMoves = 0;

  for (int i = 0; i < gameBoard.length; i++) {
    for (int j = 0; j < gameBoard[i].length; j++) {
      if (gameBoard[i][j].isNotEmpty) {
        totalMoves++;
      }
    }
  }

  return totalMoves;
}

void _updateGamesPlayed() {
  Provider.of<GameStats>(context, listen: false).incrementGamesPlayed();
}

void _updateGamesWon() {
  Provider.of<GameStats>(context, listen: false).incrementGamesWon();
}

  void _updateLeastMoves(int moves) {
  Provider.of<GameStats>(context, listen: false).updateLeastMoves(moves);
  }

   void _updateMostMoves(int moves) {
  Provider.of<GameStats>(context, listen: false).updateMostMoves(moves);
  }
}

//Single Player Game Mode
class SPGamePage extends StatefulWidget {
  const SPGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SPGamePageState createState() => _SPGamePageState();
}

class _SPGamePageState extends State<SPGamePage> {

bool playerState = true;
String playerOne = 'X';
String playerTwo = 'O';
List<List<String>> displayPiece = List.generate(9, (_) => List.filled(9, ""));
List<String> bigBoard = List.filled(9, "");
int nextMove = -1;
Random random = Random();
int CPUi = 0; 
int CPUindex = 0;

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

      //cpu response
      if (playerState == false) {
        nextMove = getCPUmove(nextMove);
        playerState = !playerState;

        //
      }

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

int getCPUmove (int index) {
  CPUi = random.nextInt(9);
  CPUindex = random.nextInt(9);
  
  if (nextMove == -1 || checkWin(displayPiece[nextMove], playerOne) || checkWin(displayPiece[nextMove], playerTwo)) {
    if (displayPiece[CPUindex][CPUi] != playerOne || displayPiece[CPUindex][CPUi] != playerTwo) {
      displayPiece[CPUindex][CPUi] = playerTwo;
      check(CPUindex, CPUi);
    } else {
      getCPUmove(index);
    }
  } else {
    if (displayPiece[index][CPUi] == "") { 
      displayPiece[index][CPUi] = playerTwo;
      check(index, CPUi);
    } else {
      getCPUmove(index);
    }
  }
  return CPUi;
}

void check(int index, int i) {
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