# Background

Given a data file containing a grid of tree heights, solve the following two
scenarios:

**Part 1**

> how many trees are visible from outside the grid?

**Part 2**

> ...

# Solution

This uses `matrix` again! Count the edges, the count the inner trees by looking
up & down each `column` and left & right across each `row`.

```
# minitest
ruby solve_test.rb --verbose
```
