# Background

Given a data file containing Elf team cleaning schedules,
solve the following two scenarios:

**Part 1**

> In how many assignment pairs does one range fully contain the other?

**Part 2**

> In how many assignment pairs do the ranges overlap?

# Solution

This involves more fun with `Array` and `Range`! `intersection` is back, and
brought their friend `difference`.

```
# minitest
ruby solve_test.rb --verbose
```
