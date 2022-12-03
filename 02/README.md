# Background

Given a data file for Rock/Paper/Scissors matches, solve the following two scenarios:

**Part 1**

> The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors.
> What would your total score be if everything goes exactly according to your strategy guide?

**Part 2**

> Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win
> What would your total score be if everything goes exactly according to your strategy guide?

# Solution

This leans on the `matrix` class from stdlib to build out a lookup table of
rules, describing the possible combinations of rock/paper/scissors and their
various outcomes (win/loss/draw)


|||<br>rock|player2 (elf)<br>paper|<br>scissors|
|---|---|:---:|:---:|:---:|
||rock|`draw`|`loss`|`win`|
|**player1 (me)**|paper|`win`|`draw`|`loss`|
||scissors|`loss`|`win`|`draw`|


```
# minitest
ruby solve_test.rb --verbose
```
