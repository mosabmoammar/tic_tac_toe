import 'dart:io';

class TicTacToe {
  late List<List<String>> _board;
  late String _currentPlayer;
  bool _isGameOver = false;

  TicTacToe() {
    _board = List.generate(3, (_) => List.filled(3, ' '));
    _currentPlayer = 'X';
  }

  void displayBoard() {
    print('\nCurrent Board:');
    for (int i = 0; i < 3; i++) {
      print(' ${_board[i][0]} | ${_board[i][1]} | ${_board[i][2]} ');
      if (i < 2) print('---+---+---');
    }
    print('');
  }

  void playerMove() {
    while (true) {
      stdout.write('Player $_currentPlayer, enter your move (1-9): ');
      String? input = stdin.readLineSync();
      int? move = int.tryParse(input ?? '');
      if (move == null || move < 1 || move > 9) {
        print('Invalid input. Please enter a number between 1 and 9.');
        continue;
      }
      int row = (move - 1) ~/ 3;
      int col = (move - 1) % 3;
      if (_board[row][col] != ' ') {
        print('Cell already taken. Choose another.');
        continue;
      }
      _board[row][col] = _currentPlayer;
      break;
    }
  }

  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] == _currentPlayer &&
          _board[i][1] == _currentPlayer &&
          _board[i][2] == _currentPlayer) {
        return true;
      }
      if (_board[0][i] == _currentPlayer &&
          _board[1][i] == _currentPlayer &&
          _board[2][i] == _currentPlayer) {
        return true;
      }
    }
    if (_board[0][0] == _currentPlayer &&
        _board[1][1] == _currentPlayer &&
        _board[2][2] == _currentPlayer) {
      return true;
    }
    if (_board[0][2] == _currentPlayer &&
        _board[1][1] == _currentPlayer &&
        _board[2][0] == _currentPlayer) {
      return true;
    }
    return false;
  }

  bool checkDraw() {
    for (var row in _board) {
      if (row.contains(' ')) return false;
    }
    return true;
  }

  void switchPlayer() {
    _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
  }

  void play() {
    _isGameOver = false;
    while (!_isGameOver) {
      displayBoard();
      playerMove();
      if (checkWin()) {
        displayBoard();
        print('Player $_currentPlayer wins!');
        _isGameOver = true;
      } else if (checkDraw()) {
        displayBoard();
        print('It\'s a draw!');
        _isGameOver = true;
      } else {
        switchPlayer();
      }
    }
  }
}

void main() {
  print('Welcome to Tic-Tac-Toe!');
  while (true) {
    TicTacToe game = TicTacToe();
    game.play();
    stdout.write('Play again? (y/n): ');
    String? again = stdin.readLineSync();
    if (again == null || again.toLowerCase() != 'y') {
      print('Thanks for playing!');
      break;
    }
  }
}