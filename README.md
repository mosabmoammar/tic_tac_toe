# Tic-Tac-Toe (Dart CLI)

A two-player Tic-Tac-Toe game for the terminal, written in plain Dart with no dependencies.

```
Current Board:
 X | O |   
---+---+---
   | X |   
---+---+---
 O |   | X 

Player X wins!
```

## Features

- Two players take turns as X and O on one keyboard
- Moves entered as numbers 1 to 9, mapped to the board cells left to right, top to bottom
- Input validation for non-numbers, out-of-range values and occupied cells
- Win detection on rows, columns and both diagonals, plus draw detection
- Option to play again after each game

## Run it

Requires the [Dart SDK](https://dart.dev/get-dart) 3.7 or newer.

```sh
git clone https://github.com/mosabmoammar/tic_tac_toe.git
cd tic_tac_toe
dart run
```

## Code overview

All game logic lives in `bin/tic_tac_toe.dart`, in a single `TicTacToe` class: `displayBoard()`, `playerMove()`, `checkWin()`, `checkDraw()` and the `play()` loop.
