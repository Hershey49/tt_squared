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

11/21/23
-Created a base Home, Stats, Info Page for the future. Made buttons to go from Home Page to the 3 pages.
-Need to do research on icons to replace the buttons with icons in the future (if needed)
-Ran into a problem where you can't have 2 Elevated Buttons in the same child so had to fix that.
-Next steps are working on the algorythm (checkWinner function), will need to do some research on this.
-Made modifications to _tapped function that prevents player overruling existing pieces
-CheckWinner Function + Player Win count increment
-Research how we can use Firebase for Authentication

11/23/23
-Finished the Algorithm for checking game wins
-Came up with the idea of having the Big Board as a single Empty list that acts like a Small Board
-(cont.) that is checked whenever a Small Board is won
- Need to add some reset functionality after a game is won so all squares return to empty
-Currently I can only print the win statement in the terminal, so next step is a popup
- Worked on Reset Mode function. Having trouble implementing a AlertDialog/ShowDialog prompt
-(cont.) for Big Board wins. Will have to do some research into that.
-Incorporated Snackbar for Smallboard wins to not distract from the game

11/24/23
-Finished Popup for Game Reset
-Need to implement game board restriction for moves between small boards
-(cont.) Use another temp variable to keep track of last move ?
-Need to work on score in Game Screen and overall stats/leaderboard page

11/25/23
-Worked on Game Board Restriction functionality. Running into error where a complete board 
-(cont.) makes the game not continuable. Will need to add a clause for that
-Need to work on the size of game page. Wrapping in container and Sized box didn't work.
*/

/* Shreya Dubey
11/19/23
-Testing Github and Repo
*/

/*Jessica Harris
*/