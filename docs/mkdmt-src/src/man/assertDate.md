
## Convert to Date (or POSIXct) and assert successful conversion

### Description

Converts its input to type `Date` (or `POSIXct`), and asserts that the
content is in fact of suitable type by checking for remaining `NA`

### Usage

``` R
assertDate(x)

assertTime(x)
```

### Arguments

|     |                                                     |
|-----|-----------------------------------------------------|
| `x` | An input object suitable for `anydate` or `anytime` |

### Details

Note that these functions *just check for `NA`* and cannot check for
semantic correctness.

### Value

A vector of `Date` or `POSIXct` objects. As a side effect, an error will
be thrown in any of the input was not convertible.

### Author(s)

Dirk Eddelbuettel

### Examples

``` R
assertDate(c("2001/02/03", "2001-02-03", "20010203"))
assertTime(c("2001/02/03 04:05:06", "2001-02-03  04:05:06", "20010203 040506"))
```

