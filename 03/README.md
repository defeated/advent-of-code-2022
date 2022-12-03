# Background

Given a data file containing a list of items for each rucksack, solve the following two scenarios:

**Part 1**

> Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?

**Part 2**

> Find the item type that corresponds to the badges of each three-Elf group. What is the sum of the priorities of those item types?

# Solution

This is an exercise in Array manipulation 😅 and uses methods like `flat_map`,
 `each_slice`, and especially `intersection` to do the heavy lifting!

```
# minitest
ruby solve_test.rb --verbose
```
