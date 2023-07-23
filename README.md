# TicTacToe

A simple tic tac toe core using Set and array where index of array determine the position in board and states -1, 1 and 0 determine whether the position is empty, cross or circle respectively. The performance can be further improved using binary number based solution, but using data structures makes it more easy for maintenance and wider audience understanding it. 

Game state can be win, draw or nextMove.

There is simple Console debugger that can print every step along the way to console something like:
```
******************************** 

Turn 1:
X moved to 1


       | X |         0 | 1 | 2
    -----------     -----------
       |   |         3 | 4 | 5
    -----------     -----------
       |   |         6 | 7 | 8


********************************
``` 
To initialize engine we can use
```swift
let game = TicTacToe(firstPlayer: .cross)
game.play(moveIndex: 1) // X turn
// Once firstplayer is set game automatically assumes next move to be of secondplayer and so on
game.play(moveIndex: 4) // O turn
```
