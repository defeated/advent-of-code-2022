# Background

Given a data file containing piles of crates and instructions,
solve the following two scenarios:

**Part 1**

> Crates are moved one at a time, after the rearrangement procedure completes,
> what crate ends up on top of each stack?

**Part 2**

> With the ability to pick up and move multiple crates at once,
> after the rearrangement procedure completes, what crate ends up on top of
> each stack?

# Solution

This time we abuse `csv` again, massaging the crate "diagram" into vertical
columns. Then we take advantage of `Array#transpose` to rotate the data
horizontally. Lastly we use `Regex` capture groups to extract variables from
the instruction sets, before `shift`-ing and `unshift`-ing from the front of
each row.

```
# minitest
ruby solve_test.rb --verbose
```
