# Background

Given a data file, solve the following two scenarios:

**Part 1**

> Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?

**Part 2**

> Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?

# Solution

This leans on `csv` parsing from the stdlib which has some nice affordances for converting strings to integers and massaging a file into rows & columns (obviously.)

```
# minitest
ruby solve_test.rb --verbose
```
