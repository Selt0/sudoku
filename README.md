# Sudoku

Play sudoku in ruby

_Sudoku files comes included :)_

choose a file and load the game

```ruby
game = Sudoku.parse_file('sudoku1.txt')

game2 = Sudoku.parse_file('sudoku2.txt')

game3 = Sudoku.parse_file('sudoku3.txt')
```

Then use the run command:

```ruby
game.run

game2.run

game3.run
```

The default values are loaded in cyan.

---

```ruby
  0 1 2 3 4 5 6 7 8
0   3   2   6
1 9     3   5     1
2     1 8   6 4
3     8 1   2 9
4 7               8
5     6 7   8 2
6     2 6   9 5
7 8     2   3     9
8     5   1   3
Enter a position on the board (e.g., '0 4')
>
```
