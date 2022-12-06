# Background

Given a data file containing a datastream buffer, solve the following two
scenarios:

**Part 1**

> How many characters need to be processed before the first start-of-packet marker is detected?

**Part 2**

> How many characters need to be processed before the first start-of-message marker is detected?

# Solution

This is an exercise in enumerables. Didn't love this solution but it worked.
It breaks down the string into chunks and compares uniqueness within each
chunk.

```
# minitest
ruby solve_test.rb --verbose
```
