# Background

Given a data file containing filesystem commands, solve the following
two scenarios:

**Part 1**

> Find all of the directories with a total size of at most 100000. What is the
> sum of the total sizes of those directories?

**Part 2**

> ...

# Solution

This leans on more stdlib goodness from `strscan` and `pathname`;
`StringScanner` parses each line and `Pathname` creates absolute paths, and
it's `ascend` method is used to recursively update a hash of sizes.

```
# minitest
ruby solve_test.rb --verbose
```
